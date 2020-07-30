//
//  HappyCodable.generated.swift
//  HappyCodable auto created.
//  Do not edit this file!
//
//  Created by 庄黛淳华 on 2020-07-30 16:11:56 +0000.
//  Copyright © 2020 庄黛淳华. All rights reserved.
//

import Foundation
import HappyCodable
	
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
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.name1 = try container.decode(default: self.name1, key: "name1", alterKeys: []) } catch { errors.append(error) }
		do { self.numberOfTips2 = try container.decode(default: self.numberOfTips2, key: "🍉", alterKeys: []) } catch { errors.append(error) }
		do { self.age = try container.decode(default: self.age, key: "234", alterKeys: ["age", "abc"]) } catch { errors.append(error) }
		
		if !Self.globalDecodeAllowOptional {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.name1, forKey: .name1) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.numberOfTips2, forKey: .numberOfTips2) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.age, forKey: .age) } catch { errors.append(error) }
		if !Self.globalEncodeSafely {
			throw errors
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
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.accessibility5 = try container.decode(default: self.accessibility5, key: "accessibility5", alterKeys: []) } catch { errors.append(error) }
		do { self.get_set = try container.decode(default: self.get_set, key: "get_set", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.globalDecodeAllowOptional {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.accessibility5, forKey: .accessibility5) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.get_set, forKey: .get_set) } catch { errors.append(error) }
		if !Self.globalEncodeSafely {
			throw errors
		}
	}
}
extension Person4 {
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.accessibility1 = try container.decode(default: self.accessibility1, key: "accessibility1", alterKeys: []) } catch { errors.append(error) }
		do { self.accessibility3 = try container.decode(default: self.accessibility3, key: "accessibility3", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.globalDecodeAllowOptional {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.accessibility1, forKey: .accessibility1) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.accessibility3, forKey: .accessibility3) } catch { errors.append(error) }
		if !Self.globalEncodeSafely {
			throw errors
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
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.name = try container.decode(default: self.name, key: "name", alterKeys: []) } catch { errors.append(error) }
		do { self.age2 = try container.decode(default: self.age2, key: "234", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.globalDecodeAllowOptional {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.name, forKey: .name) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.age2, forKey: .age2) } catch { errors.append(error) }
		if !Self.globalEncodeSafely {
			throw errors
		}
	}
}