//
//  Category.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/29/26.
//

enum Category: CaseIterable {
    case designPatterns(DesignPatternSubcategory)
    case programmingPrinciples(ProgrammingPrincipleSubcategory)
    case logicControlFlow(LogicControlFlowSubcategory)
    case memoryManagement(MemoryManagementSubcategory)
    case concurrency(ConcurrencySubcategory)
    case apiDesign(APIDesignSubcategory)
    
    static var allCases: [Category] {
        [.designPatterns(.builder),
         .programmingPrinciples(.solid),
         .logicControlFlow(.conditionError),
         .memoryManagement(.arcPitfalls),
         .concurrency(.actorIsolation),
         .apiDesign(.protocolMisuse)]
    }
}

extension Category: Codable {
    private enum CodingKeys: String, CodingKey {
        case type, value
    }
    
    private enum TypeKey: String, Codable {
        case designPatterns
        case programmingPrinciples
        case logicAndControlFlow
        case memoryManagement
        case concurrency
        case apiDesign
    }

    nonisolated func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .designPatterns(let sub):
            try container.encode(TypeKey.designPatterns, forKey: .type)
            try container.encode(sub, forKey: .value)
        case .programmingPrinciples(let sub):
            try container.encode(TypeKey.programmingPrinciples, forKey: .type)
            try container.encode(sub, forKey: .value)
        case .logicControlFlow(let sub):
            try container.encode(TypeKey.logicAndControlFlow, forKey: .type)
            try container.encode(sub, forKey: .value)
        case .memoryManagement(let sub):
            try container.encode(TypeKey.memoryManagement, forKey: .type)
            try container.encode(sub, forKey: .value)
        case .concurrency(let sub):
            try container.encode(TypeKey.concurrency, forKey: .type)
            try container.encode(sub, forKey: .value)
        case .apiDesign(let sub):
            try container.encode(TypeKey.apiDesign, forKey: .type)
            try container.encode(sub, forKey: .value)
        }
    }

    nonisolated init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(TypeKey.self, forKey: .type)
        switch type {
        case .designPatterns:
            self = .designPatterns(try container.decode(DesignPatternSubcategory.self, forKey: .value))
        case .programmingPrinciples:
            self = .programmingPrinciples(try container.decode(ProgrammingPrincipleSubcategory.self, forKey: .value))
        case .logicAndControlFlow:
            self = .logicControlFlow(try container.decode(LogicControlFlowSubcategory.self, forKey: .value))
        case .memoryManagement:
            self = .memoryManagement(try container.decode(MemoryManagementSubcategory.self, forKey: .value))
        case .concurrency:
            self = .concurrency(try container.decode(ConcurrencySubcategory.self, forKey: .value))
        case .apiDesign:
            self = .apiDesign(try container.decode(APIDesignSubcategory.self, forKey: .value))
        }
    }
}
