//
//  Category.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/29/26.
//

nonisolated enum Category: Codable, CaseIterable {
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
