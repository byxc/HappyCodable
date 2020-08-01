//
//  HappyCodable.generated.swift
//  HappyCodable auto created.
//  Do not edit this file!
//
//  Created by 庄黛淳华 on 2020-08-01 06:18:34 +0000.
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
		case name
		case id = "🆔"
		case age = "secret_number"
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.name = try container.decode(default: self.name, key: "name", alterKeys: []) } catch { errors.append(error) }
		do { self.id = try container.decode(default: self.id, key: "🆔", alterKeys: []) } catch { errors.append(error) }
		do { self.age = try container.decode(default: self.age, key: "secret_number", alterKeys: ["age"]) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.name, forKey: .name) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.id, forKey: .id) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.age, forKey: .age) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestClass_empty {
	func decode(happyFrom decoder: Decoder) throws {
	}
	func encode(happyTo encoder: Encoder) throws {
	}
}

extension TestClass_empty_public {
	public
	func decode(happyFrom decoder: Decoder) throws {
	}
	public
	func encode(happyTo encoder: Encoder) throws {
	}
}
extension TestClass_notEmpty {
	enum CodingKeys: String, CodingKey {
		case int
		case object
		case objectNil
	}
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.object = try container.decode(default: self.object, key: "object", alterKeys: []) } catch { errors.append(error) }
		do { self.objectNil = try container.decode(default: self.objectNil, key: "objectNil", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.object, forKey: .object) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.objectNil, forKey: .objectNil) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestClass_notEmpty.Class {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestClass_notEmpty.Enum {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestClass_notEmpty.Enum(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestClass_notEmpty.Enum.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestClass_notEmpty.EnumComplex {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode(RawValue.self)
		if let value = TestClass_notEmpty.EnumComplex(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestClass_notEmpty.EnumComplex.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestClass_notEmpty.Struct {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}




extension TestClass_notEmpty_public {
	enum CodingKeys: String, CodingKey {
		case int
		case object
		case objectNil
	}
	public
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.object = try container.decode(default: self.object, key: "object", alterKeys: []) } catch { errors.append(error) }
		do { self.objectNil = try container.decode(default: self.objectNil, key: "objectNil", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	public
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.object, forKey: .object) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.objectNil, forKey: .objectNil) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestClass_notEmpty_public.Class {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestClass_notEmpty_public.Enum {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestClass_notEmpty_public.Enum(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestClass_notEmpty_public.Enum.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestClass_notEmpty_public.EnumComplex {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode(RawValue.self)
		if let value = TestClass_notEmpty_public.EnumComplex(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestClass_notEmpty_public.EnumComplex.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestClass_notEmpty_public.Struct {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestEnum {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestEnum(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestEnum.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestEnumComplex {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode([String: [String: String]].self)
		let error = DecodingError.typeMismatch(TestEnumComplex.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		guard let name = content.keys.first else {
			throw error
		}
		let decoder = JSONDecoder()
		switch name {
			case ".value":
				self = .value
			case ".function(int:string:)":
				guard
					let _0 = content[name]?["int"]?.data(using: .utf8),
					let _1 = content[name]?["string"]?.data(using: .utf8)
				else {
					throw error
				}
				
				self = .function(
					int: try decoder.decode((Int).self, from: _0),
					string: try decoder.decode((String).self, from: _1)
				)
		default:
			throw error
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		let encoder = JSONEncoder()
		switch self {
			case .value:
				try container.encode([".value": [String: String]()])
			case let .function(_0, _1):
				try container.encode([
					".function(int:string:)": [
						"int": String(data: try encoder.encode(_0), encoding: .utf8),
						"string": String(data: try encoder.encode(_1), encoding: .utf8)
					]
				])
		}
	}
}
extension TestEnumDouble {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestEnumDouble(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestEnumDouble.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestEnumInt {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestEnumInt(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestEnumInt.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestEnumRawRepresentable {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode(RawValue.self)
		if let value = TestEnumRawRepresentable(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestEnumRawRepresentable.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestEnumString {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestEnumString(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestEnumString.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestStruct_ForKeyedDecodingContainer {
	enum CodingKeys: String, CodingKey {
		case Bool = "Bool_1"
		case String = "String_1"
		case Double = "Double_1"
		case Float = "Float_1"
		case Int = "Int_1"
		case Int8 = "Int8_1"
		case Int16 = "Int16_1"
		case Int32 = "Int32_1"
		case Int64 = "Int64_1"
		case UInt = "UInt_1"
		case UInt8 = "UInt8_1"
		case UInt16 = "UInt16_1"
		case UInt32 = "UInt32_1"
		case UInt64 = "UInt64_1"
		case Data = "Data_1"
		case Bool_optional = "Bool_optional_1"
		case String_optional = "String_optional_1"
		case Double_optional = "Double_optional_1"
		case Float_optional = "Float_optional_1"
		case Int_optional = "Int_optional_1"
		case Int8_optional = "Int8_optional_1"
		case Int16_optional = "Int16_optional_1"
		case Int32_optional = "Int32_optional_1"
		case Int64_optional = "Int64_optional_1"
		case UInt_optional = "UInt_optional_1"
		case UInt8_optional = "UInt8_optional_1"
		case UInt16_optional = "UInt16_optional_1"
		case UInt32_optional = "UInt32_optional_1"
		case UInt64_optional = "UInt64_optional_1"
		case Data_optional = "Data_optional_1"
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.Bool = try container.decode(default: self.Bool, key: "Bool_1", alterKeys: ["Bool_2"]) } catch { errors.append(error) }
		do { self.String = try container.decode(default: self.String, key: "String_1", alterKeys: ["String_2"]) } catch { errors.append(error) }
		do { self.Double = try container.decode(default: self.Double, key: "Double_1", alterKeys: ["Double_2"]) } catch { errors.append(error) }
		do { self.Float = try container.decode(default: self.Float, key: "Float_1", alterKeys: ["Float_2"]) } catch { errors.append(error) }
		do { self.Int = try container.decode(default: self.Int, key: "Int_1", alterKeys: ["Int_2"]) } catch { errors.append(error) }
		do { self.Int8 = try container.decode(default: self.Int8, key: "Int8_1", alterKeys: ["Int8_2"]) } catch { errors.append(error) }
		do { self.Int16 = try container.decode(default: self.Int16, key: "Int16_1", alterKeys: ["Int16_2"]) } catch { errors.append(error) }
		do { self.Int32 = try container.decode(default: self.Int32, key: "Int32_1", alterKeys: ["Int32_2"]) } catch { errors.append(error) }
		do { self.Int64 = try container.decode(default: self.Int64, key: "Int64_1", alterKeys: ["Int64_2"]) } catch { errors.append(error) }
		do { self.UInt = try container.decode(default: self.UInt, key: "UInt_1", alterKeys: ["UInt_2"]) } catch { errors.append(error) }
		do { self.UInt8 = try container.decode(default: self.UInt8, key: "UInt8_1", alterKeys: ["UInt8_2"]) } catch { errors.append(error) }
		do { self.UInt16 = try container.decode(default: self.UInt16, key: "UInt16_1", alterKeys: ["UInt16_2"]) } catch { errors.append(error) }
		do { self.UInt32 = try container.decode(default: self.UInt32, key: "UInt32_1", alterKeys: ["UInt32_2"]) } catch { errors.append(error) }
		do { self.UInt64 = try container.decode(default: self.UInt64, key: "UInt64_1", alterKeys: ["UInt64_2"]) } catch { errors.append(error) }
		do { self.Data = try container.decode(default: self.Data, key: "Data_1", alterKeys: ["Data_2"]) } catch { errors.append(error) }
		do { self.Bool_optional = try container.decode(default: self.Bool_optional, key: "Bool_optional_1", alterKeys: ["Bool_optional_2"]) } catch { errors.append(error) }
		do { self.String_optional = try container.decode(default: self.String_optional, key: "String_optional_1", alterKeys: ["String_optional_2"]) } catch { errors.append(error) }
		do { self.Double_optional = try container.decode(default: self.Double_optional, key: "Double_optional_1", alterKeys: ["Double_optional_2"]) } catch { errors.append(error) }
		do { self.Float_optional = try container.decode(default: self.Float_optional, key: "Float_optional_1", alterKeys: ["Float_optional_2"]) } catch { errors.append(error) }
		do { self.Int_optional = try container.decode(default: self.Int_optional, key: "Int_optional_1", alterKeys: ["Int_optional_2"]) } catch { errors.append(error) }
		do { self.Int8_optional = try container.decode(default: self.Int8_optional, key: "Int8_optional_1", alterKeys: ["Int8_optional_2"]) } catch { errors.append(error) }
		do { self.Int16_optional = try container.decode(default: self.Int16_optional, key: "Int16_optional_1", alterKeys: ["Int16_optional_2"]) } catch { errors.append(error) }
		do { self.Int32_optional = try container.decode(default: self.Int32_optional, key: "Int32_optional_1", alterKeys: ["Int32_optional_2"]) } catch { errors.append(error) }
		do { self.Int64_optional = try container.decode(default: self.Int64_optional, key: "Int64_optional_1", alterKeys: ["Int64_optional_2"]) } catch { errors.append(error) }
		do { self.UInt_optional = try container.decode(default: self.UInt_optional, key: "UInt_optional_1", alterKeys: ["UInt_optional_2"]) } catch { errors.append(error) }
		do { self.UInt8_optional = try container.decode(default: self.UInt8_optional, key: "UInt8_optional_1", alterKeys: ["UInt8_optional_2"]) } catch { errors.append(error) }
		do { self.UInt16_optional = try container.decode(default: self.UInt16_optional, key: "UInt16_optional_1", alterKeys: ["UInt16_optional_2"]) } catch { errors.append(error) }
		do { self.UInt32_optional = try container.decode(default: self.UInt32_optional, key: "UInt32_optional_1", alterKeys: ["UInt32_optional_2"]) } catch { errors.append(error) }
		do { self.UInt64_optional = try container.decode(default: self.UInt64_optional, key: "UInt64_optional_1", alterKeys: ["UInt64_optional_2"]) } catch { errors.append(error) }
		do { self.Data_optional = try container.decode(default: self.Data_optional, key: "Data_optional_1", alterKeys: ["Data_optional_2"]) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.Bool, forKey: .Bool) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.String, forKey: .String) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Double, forKey: .Double) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Float, forKey: .Float) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int, forKey: .Int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int8, forKey: .Int8) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int16, forKey: .Int16) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int32, forKey: .Int32) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int64, forKey: .Int64) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt, forKey: .UInt) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt8, forKey: .UInt8) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt16, forKey: .UInt16) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt32, forKey: .UInt32) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt64, forKey: .UInt64) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Data, forKey: .Data) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Bool_optional, forKey: .Bool_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.String_optional, forKey: .String_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Double_optional, forKey: .Double_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Float_optional, forKey: .Float_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int_optional, forKey: .Int_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int8_optional, forKey: .Int8_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int16_optional, forKey: .Int16_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int32_optional, forKey: .Int32_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Int64_optional, forKey: .Int64_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt_optional, forKey: .UInt_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt8_optional, forKey: .UInt8_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt16_optional, forKey: .UInt16_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt32_optional, forKey: .UInt32_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.UInt64_optional, forKey: .UInt64_optional) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.Data_optional, forKey: .Data_optional) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_ForKeyedDecodingContainer.Data {
	enum CodingKeys: String, CodingKey {
		case data
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.data = try container.decode(default: self.data, key: "data", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.data, forKey: .data) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_empty {
	mutating
	func decode(happyFrom decoder: Decoder) throws {
	}
	func encode(happyTo encoder: Encoder) throws {
	}
}

extension TestStruct_empty_public {
	mutating
	public
	func decode(happyFrom decoder: Decoder) throws {
	}
	public
	func encode(happyTo encoder: Encoder) throws {
	}
}
extension TestStruct_notEmpty {
	enum CodingKeys: String, CodingKey {
		case int
		case object
		case objectNil
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.object = try container.decode(default: self.object, key: "object", alterKeys: []) } catch { errors.append(error) }
		do { self.objectNil = try container.decode(default: self.objectNil, key: "objectNil", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.object, forKey: .object) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.objectNil, forKey: .objectNil) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_notEmpty.Class {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_notEmpty.Enum {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestStruct_notEmpty.Enum(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestStruct_notEmpty.Enum.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestStruct_notEmpty.EnumComplex {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode(RawValue.self)
		if let value = TestStruct_notEmpty.EnumComplex(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestStruct_notEmpty.EnumComplex.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestStruct_notEmpty.Struct {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}




extension TestStruct_notEmpty_public {
	enum CodingKeys: String, CodingKey {
		case int
		case object
		case objectNil
	}
	mutating
	public
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.object = try container.decode(default: self.object, key: "object", alterKeys: []) } catch { errors.append(error) }
		do { self.objectNil = try container.decode(default: self.objectNil, key: "objectNil", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	public
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.object, forKey: .object) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.objectNil, forKey: .objectNil) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_notEmpty_public.Class {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_notEmpty_public.Enum {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content: RawValue = try container.decodeSafe()
		if let value = TestStruct_notEmpty_public.Enum(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestStruct_notEmpty_public.Enum.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestStruct_notEmpty_public.EnumComplex {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let content = try container.decode(RawValue.self)
		if let value = TestStruct_notEmpty_public.EnumComplex(rawValue: content) {
			self = value
		} else {
			throw DecodingError.typeMismatch(TestStruct_notEmpty_public.EnumComplex.self, DecodingError.Context(codingPath: [], debugDescription: ""))
		}
	}
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.rawValue)
	}
}
extension TestStruct_notEmpty_public.Struct {
	enum CodingKeys: String, CodingKey {
		case int
		case string
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.int = try container.decode(default: self.int, key: "int", alterKeys: []) } catch { errors.append(error) }
		do { self.string = try container.decode(default: self.string, key: "string", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.int, forKey: .int) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.string, forKey: .string) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}
extension TestStruct_withAttribute {
	enum CodingKeys: String, CodingKey {
		case codingKeys = "codingKey1"
		case optional_allow
		case optional_notAllow
	}
	mutating
	func decode(happyFrom decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: StringCodingKey.self)
		var errors = [Error]()
		
		do { self.codingKeys = try container.decode(default: self.codingKeys, key: "codingKey1", alterKeys: ["codingKey2", "🍉"]) } catch {  }
		do { self.optional_allow = try container.decode(default: self.optional_allow, key: "optional_allow", alterKeys: []) } catch {  }
		do { self.optional_notAllow = try container.decode(default: self.optional_notAllow, key: "optional_notAllow", alterKeys: []) } catch { errors.append(error) }
		
		if !Self.allowHappyDecodableSkipMissing, !errors.isEmpty {
			throw errors
		}
	}
	func encode(happyTo encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		var errors = [Error]()
		do { try container.encodeIfPresent(self.codingKeys, forKey: .codingKeys) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.optional_allow, forKey: .optional_allow) } catch { errors.append(error) }
		do { try container.encodeIfPresent(self.optional_notAllow, forKey: .optional_notAllow) } catch { errors.append(error) }
		if !Self.allowHappyEncodableSafely, !errors.isEmpty {
			throw errors
		}
	}
}