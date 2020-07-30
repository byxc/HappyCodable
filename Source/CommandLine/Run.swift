//
//  Run.swift
//  HappyCodable
//
//  Created by 庄黛淳华 on 2020/6/17.
//

import Foundation
import SourceKittenFramework
import CryptoSwift

let version = "0.0.1"

let queue = OperationQueue()
let fileLock = DispatchSemaphore(value: 1)
var objects = [String: [Object]]()
var objectsWithCodable = Set<String>()

var excludedPath: String = ""
var needGenerated = false

var filePrefix = ""

var operationCountOberver: NSKeyValueObservation?

var rawRepresentableRawValues = [
	"Bool",
	"String",
	"Double",
	"Float",
	"Int",
	"Int8",
	"Int16",
	"Int32",
	"Int64",
	"UInt",
	"UInt8",
	"UInt16",
	"UInt32",
	"UInt64"
]
var anonymousFunctionShortNames = [
	"==",
	"-=",
	"<",
	">",
	"~=",
	"subscript"
]

public func main(path: String, createdFilePath: String) {
	excludedPath = createdFilePath
	guard let contents = try? FileManager.default.contentsOfDirectory(atPath: path) else { return }
	generateFilePrefix(filename: URL(fileURLWithPath: createdFilePath).lastPathComponent)
	
	#if DEBUG
	queue.maxConcurrentOperationCount = 1
	#else
	queue.maxConcurrentOperationCount = 20
	#endif
	
	let begin = Date().timeIntervalSince1970
	foreach(contents: contents, from: path)
	
	operationCountOberver = queue.observe(\.operationCount, options: [.new]) { (queue, value) in
		guard value.newValue == 0 else { return }
		generateTargetFile(to: createdFilePath)
		print("total time: \(Date().timeIntervalSince1970-begin)")
		exit(EXIT_SUCCESS)
	}
}


func generateFilePrefix(filename: String) {
	filePrefix =
	"""
	//
	//  \(filename)
	//  HappyCodable auto created.
	//  Do not edit this file!
	//
	//  Created by 庄黛淳华 on \(Date()).
	//  Copyright © 2020 庄黛淳华. All rights reserved.
	//
	
	import Foundation
	import HappyCodable
		
	
	"""
}

func foreach(contents: [String], from: String) {
	
	for content in contents {
		var isDirectory: ObjCBool = false
		let path = URL(fileURLWithPath: from).appendingPathComponent(content).path
		guard FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) else { continue }
		if isDirectory.boolValue {
			guard let contents = try? FileManager.default.contentsOfDirectory(atPath: path) else { continue }
			foreach(contents: contents, from: path)
		} else {
			queue.addOperation {
				docs(for: path)
			}
		}
	}
}

func docs(for path: String) {
	guard
		URL(fileURLWithPath: path).pathExtension == "swift",
		path != excludedPath,
		let file = File(path: path),
		let doc = SwiftDocs(file: file, arguments: []),
		let substructures = doc.docsDictionary[SwiftDocKey.substructure]?.dicArray,
		!substructures.isEmpty,
		let cacheFolder = file.cacheFolder,
		let fileMD5 = file.fileMD5
		else { return }
	print("docs for \(path)")
	let cachePath = cacheFolder.appendingPathComponent(fileMD5)
	
	print("get cache from \(cachePath)")
	do {
		#if DEBUG
		if file.path?.contains("/BookDetail.swift") ?? false {
			print(1)
		}
		#endif
		let jsonData = try Data(contentsOf: cachePath)
		let decodeObjects = try JSONDecoder().decode([Object].self, from: jsonData)
		for object in decodeObjects {
			fileLock.wait()
			objects[object.name, default: []].append(object)
			if object.isConfirmToEncodable || object.isConfirmToDecodable {
				objectsWithCodable.insert(object.name)
			}
			fileLock.signal()
		}
		print("get objects of \(path) from cache")
		return
	} catch {
		needGenerated = true
		print(error)
	}
	
	print("creating objects for \(path)")
	var objectsInCurrentFile = [Object]()
	func happySubstructures(from substructures: [[String: SourceKitRepresentable]], typePrefix: [String] = []) {
		for var substructure in substructures {
			guard
				let name = substructure[SwiftDocKey.name]?.string,
				let kind = substructure[SwiftDocKey.kind]?.string.flatMap(SwiftDeclarationKind.init(rawValue:))
			else { return }
			
			let isExtension: Bool
			switch kind {
			case .class, .enum, .struct:
				isExtension = false
				break
			case .extension, .extensionClass, .extensionEnum, .extensionStruct:
				isExtension = true
				break
			default: continue
			}
			let parentName = "\(typePrefix.joined(separator: "."))"
			let fullName: String
			if !parentName.isEmpty {
				fullName = "\(parentName).\(name)"
			} else {
				fullName = name
			}
			substructure[SwiftDocKey.name] = fullName

			guard var object = Object(substructure, file: file) else {
				continue
			}
			object.isExtension = isExtension
			
			if object.isConfirmToEncodable {
				fileLock.wait()
				objectsWithCodable.insert(fullName)
				fileLock.signal()
			}
			if object.isConfirmToDecodable {
				fileLock.wait()
				objectsWithCodable.insert(fullName)
				fileLock.signal()
			}
			let subSubstructure = substructure[SwiftDocKey.substructure]?.dicArray
			
			if name == "CodingKeys",
				object.type == .enum,
				let subSubstructure = subSubstructure,
				!subSubstructure.isEmpty,
				!objectsInCurrentFile.isEmpty,
				let objectIndex = objectsInCurrentFile.firstIndex(where: {
					$0.name == parentName
				}) {
			// then
				#if DEBUG
				if parentName == "BookDetail" {
					print(1)
				}
				#endif
				var object = objectsInCurrentFile[objectIndex]
				let cases = subSubstructure.filter({
					$0[SwiftDocKey.kind]?
						.string
						.map(SwiftDeclarationKind.init(rawValue:)) == .enumcase
				}).compactMap({
					$0[SwiftDocKey.substructure]?.dicArray?.first?[SwiftDocKey.name]?.string
				})
				
				object.customCodingKeys = cases
				objectsInCurrentFile[objectIndex] = object
				
				return
			}
			
			objectsInCurrentFile.append(object)
			
			if object.inheritedtypes.contains("RawRepresentable") {
				rawRepresentableRawValues.append(object.name)
			}
			
			if let subSubstructure = subSubstructure {
				happySubstructures(from: subSubstructure, typePrefix: typePrefix+[name])
			}
		}
	}
	happySubstructures(from: substructures)
	
	fileLock.wait()
	for object in objectsInCurrentFile {
		objects[object.name, default: []].append(object)
	}
	fileLock.signal()
	
	do {
		try FileManager.default.createDirectory(at: cacheFolder, withIntermediateDirectories: true, attributes: nil)
		let encoder = JSONEncoder()
		#if DEBUG
		encoder.outputFormatting = .prettyPrinted
		#endif
		try encoder.encode(objectsInCurrentFile).write(to: cachePath, options: .atomicWrite)
	} catch {
		print(error)
	}
}

func generateTargetFile(to path: String) {
	print("generatedTargetFile to \(path)")
	print("generated objects: \(objectsWithCodable)")
	
	let code = filePrefix  + objectsWithCodable.sorted().compactMap {
		objects[$0]
	}.map({
		$0.generatedCode
	}).joined(separator: "\n")
	do {
		try code.write(toFile: path, atomically: true, encoding: .utf8)
	} catch {
		print(error)
	}
}
