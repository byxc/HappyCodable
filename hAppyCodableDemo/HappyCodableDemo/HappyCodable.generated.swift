//
//  HappyCodable.generated.swift
//  HappyCodable auto created.
//  Do not edit this file!
//
//  Created by 庄黛淳华 on 2020-06-28 07:44:12 +0000.
//  Copyright © 2020 庄黛淳华. All rights reserved.
//

import Foundation
	
extension EnumTest {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode([String: [String: String]].self)
		let error = DecodingError.typeMismatch(EnumTest.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		guard let name = content.keys.first else {
			throw error
		}
		let decoder = JSONDecoder()
		switch name {
			case ".value(num:name:)":
				guard
					let _0 = content[name]?["num"]?.data(using: .utf8),
					let _1 = content[name]?["name"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .value(
					num: try decoder.decode((Int).self, from: _0),
					name: try decoder.decode((String).self, from: _1)
				)
			case ".name0(_:)":
				guard
					let _0 = content[name]?["$0"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .name0(
					try decoder.decode((String).self, from: _0)
				)
			case ".name1(_:last:)":
				guard
					let _0 = content[name]?["$0"]?.data(using: .utf8),
					let _1 = content[name]?["last"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .name1(
					try decoder.decode((String).self, from: _0),
					last: try decoder.decode((String).self, from: _1)
				)
			case ".name2(first:_:)":
				guard
					let _0 = content[name]?["first"]?.data(using: .utf8),
					let _1 = content[name]?["$1"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .name2(
					first: try decoder.decode((String).self, from: _0),
					try decoder.decode((String).self, from: _1)
				)
			case ".name3(_:_:)":
				guard
					let _0 = content[name]?["first"]?.data(using: .utf8),
					let _1 = content[name]?["last"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .name3(
					try decoder.decode((String).self, from: _0),
					try decoder.decode((String).self, from: _1)
				)
		default:
			throw error
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let encoder = JSONEncoder()
		switch self {
			case let .value(_0, _1):
				try container.encode([
					".value(num:name:)": [
						"num": String(data: try encoder.encode(_0), encoding: .utf8),
						"name": String(data: try encoder.encode(_1), encoding: .utf8)
					]
				])
			case let .name0(_0):
				try container.encode([
					".name0(_:)": [
						"$0": String(data: try encoder.encode(_0), encoding: .utf8)
					]
				])
			case let .name1(_0, _1):
				try container.encode([
					".name1(_:last:)": [
						"$0": String(data: try encoder.encode(_0), encoding: .utf8),
						"last": String(data: try encoder.encode(_1), encoding: .utf8)
					]
				])
			case let .name2(_0, _1):
				try container.encode([
					".name2(first:_:)": [
						"first": String(data: try encoder.encode(_0), encoding: .utf8),
						"$1": String(data: try encoder.encode(_1), encoding: .utf8)
					]
				])
			case let .name3(_0, _1):
				try container.encode([
					".name3(_:_:)": [
						"first": String(data: try encoder.encode(_0), encoding: .utf8),
						"last": String(data: try encoder.encode(_1), encoding: .utf8)
					]
				])
		}
	}
}
extension Person {
	enum CodingKeys: String, CodingKey {
		case name1
		case numberOfTips2 = "🍉"
		case age = "234"
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if Self.globalDecodeAllowOptional {
			do { self.name1 = try decoder.decode(defaultValue: self.name1, verifyValue: self.name1, forKey: .name1, alterKeys: [], from: container) } catch { }
			do { self.numberOfTips2 = try decoder.decode(defaultValue: self.numberOfTips2, verifyValue: self.numberOfTips2, forKey: .numberOfTips2, alterKeys: [], from: container) } catch { }
			do { self.age = try decoder.decode(defaultValue: self.age, verifyValue: self.age, forKey: .age, alterKeys: ["age", "abc"], from: container) } catch { }
		} else {
			self.name1 = try decoder.decode(defaultValue: self.name1, verifyValue: self.name1, forKey: .name1, alterKeys: [], from: container)
			self.numberOfTips2 = try decoder.decode(defaultValue: self.numberOfTips2, verifyValue: self.numberOfTips2, forKey: .numberOfTips2, alterKeys: [], from: container)
			self.age = try decoder.decode(defaultValue: self.age, verifyValue: self.age, forKey: .age, alterKeys: ["age", "abc"], from: container)
		}
		
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		if Self.globalEncodeSafely {
			do { try container.encodeIfPresent(self.name1, forKey: .name1) } catch { }
			do { try container.encodeIfPresent(self.numberOfTips2, forKey: .numberOfTips2) } catch { }
			do { try container.encodeIfPresent(self.age, forKey: .age) } catch { }
		} else {
			try container.encode(self.name1, forKey: .name1)
			try container.encode(self.numberOfTips2, forKey: .numberOfTips2)
			try container.encode(self.age, forKey: .age)
		}
	}
}
extension Person3 {
	enum CodingKeys: String, CodingKey {
		case accessibility5
		case get_set
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if Self.globalDecodeAllowOptional {
			do { self.accessibility5 = try decoder.decode(defaultValue: self.accessibility5, verifyValue: self.accessibility5, forKey: .accessibility5, alterKeys: [], from: container) } catch { }
			do { self.get_set = try decoder.decode(defaultValue: self.get_set, verifyValue: self.get_set, forKey: .get_set, alterKeys: [], from: container) } catch { }
		} else {
			self.accessibility5 = try decoder.decode(defaultValue: self.accessibility5, verifyValue: self.accessibility5, forKey: .accessibility5, alterKeys: [], from: container)
			self.get_set = try decoder.decode(defaultValue: self.get_set, verifyValue: self.get_set, forKey: .get_set, alterKeys: [], from: container)
		}
		
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		if Self.globalEncodeSafely {
			do { try container.encodeIfPresent(self.accessibility5, forKey: .accessibility5) } catch { }
			do { try container.encodeIfPresent(self.get_set, forKey: .get_set) } catch { }
		} else {
			try container.encode(self.accessibility5, forKey: .accessibility5)
			try container.encode(self.get_set, forKey: .get_set)
		}
	}
}
extension Person4 {
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if Self.globalDecodeAllowOptional {
			do { self.accessibility1 = try decoder.decode(defaultValue: self.accessibility1, verifyValue: self.accessibility1, forKey: .accessibility1, alterKeys: [], from: container) } catch { }
			do { self.accessibility3 = try decoder.decode(defaultValue: self.accessibility3, verifyValue: self.accessibility3, forKey: .accessibility3, alterKeys: [], from: container) } catch { }
		} else {
			self.accessibility1 = try decoder.decode(defaultValue: self.accessibility1, verifyValue: self.accessibility1, forKey: .accessibility1, alterKeys: [], from: container)
			self.accessibility3 = try decoder.decode(defaultValue: self.accessibility3, verifyValue: self.accessibility3, forKey: .accessibility3, alterKeys: [], from: container)
		}
		
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		if Self.globalEncodeSafely {
			do { try container.encodeIfPresent(self.accessibility1, forKey: .accessibility1) } catch { }
			do { try container.encodeIfPresent(self.accessibility3, forKey: .accessibility3) } catch { }
		} else {
			try container.encode(self.accessibility1, forKey: .accessibility1)
			try container.encode(self.accessibility3, forKey: .accessibility3)
		}
	}
}
extension Test.Person2 {
	enum CodingKeys: String, CodingKey {
		case name
		case age2 = "234"
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		if Self.globalDecodeAllowOptional {
			do { self.name = try decoder.decode(defaultValue: self.name, verifyValue: self.name, forKey: .name, alterKeys: [], from: container) } catch { }
			do { self.age2 = try decoder.decode(defaultValue: self.age2, verifyValue: self.age2, forKey: .age2, alterKeys: [], from: container) } catch { }
		} else {
			self.name = try decoder.decode(defaultValue: self.name, verifyValue: self.name, forKey: .name, alterKeys: [], from: container)
			self.age2 = try decoder.decode(defaultValue: self.age2, verifyValue: self.age2, forKey: .age2, alterKeys: [], from: container)
		}
		
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		if Self.globalEncodeSafely {
			do { try container.encodeIfPresent(self.name, forKey: .name) } catch { }
			do { try container.encodeIfPresent(self.age2, forKey: .age2) } catch { }
		} else {
			try container.encode(self.name, forKey: .name)
			try container.encode(self.age2, forKey: .age2)
		}
	}
}