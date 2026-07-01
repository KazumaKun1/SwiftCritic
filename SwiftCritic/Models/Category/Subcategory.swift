//
//  Subcategory.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/29/26.
//

nonisolated enum DesignPatternSubcategory: String, Codable, CaseIterable {
    case builder
    case factory
    case singleton
    case adapter
    case facade
    case observer
    case strategy
    case decorator
    case composite
    case coordinator
}

nonisolated enum ProgrammingPrincipleSubcategory: String, Codable, CaseIterable {
    case solid
    case dry
    case yagni
    case kiss
    case separationOfConcerns
}

nonisolated enum LogicControlFlowSubcategory: String, Codable, CaseIterable {
    case offByOne
    case optionalMisuse
    case missingGuardClause
    case forceUnwrap
    case conditionError
}

nonisolated enum MemoryManagementSubcategory: String, Codable, CaseIterable {
    case retainCycles
    case weakUnownedMisuse
    case closureCaptures
    case arcPitfalls
    case deinitNotCalled
}

nonisolated enum ConcurrencySubcategory: String, Codable, CaseIterable {
    case actorIsolation
    case raceConditions
    case taskMisuse
    case asyncAwaitErrors
    case sendableViolations
}

nonisolated enum APIDesignSubcategory: String, Codable, CaseIterable {
    case namingClarity
    case accessControl
    case leakingInternals
    case functionSignatures
    case protocolMisuse
}
