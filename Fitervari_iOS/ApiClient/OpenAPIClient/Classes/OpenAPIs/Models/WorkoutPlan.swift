//
// WorkoutPlan.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct WorkoutPlan: Codable, Hashable {

    public var id: Int64
    public var name: String
    public var description: String
    public var validFrom: String?
    public var validTill: String?

    public init(id: Int64, name: String, description: String, validFrom: String? = nil, validTill: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.validFrom = validFrom
        self.validTill = validTill
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case description
        case validFrom = "valid_from"
        case validTill = "valid_till"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encodeIfPresent(validFrom, forKey: .validFrom)
        try container.encodeIfPresent(validTill, forKey: .validTill)
    }
}

