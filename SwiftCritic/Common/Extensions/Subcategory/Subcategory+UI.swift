//
//  Subcategory+UI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

// TODO: - For future implementation, find a way to make this avoid OCP violation even enum are supposed to be exhaustive.

nonisolated extension ProgrammingPrincipleSubcategory {
    var name: String {
        switch self {
        case .solid: "SOLID"
        case .dry: "DRY"
        case .yagni: "YAGNI"
        case .kiss: "KISS"
        case .separationOfConcerns: "Separation Of Concerns"
        }
    }
}

nonisolated extension LogicControlFlowSubcategory {
    var name: String {
        switch self {
        case .offByOne: "Off By One"
        case .optionalMisuse: "Optional Misuse"
        case .missingGuardClause: "Missing Guard Clause"
        case .forceUnwrap: "Force Unwrap"
        case .conditionError: "Condition Error"
        }
    }
}

nonisolated extension MemoryManagementSubcategory {
    var name: String {
        switch self {
        case .retainCycles: "Retain Cycles"
        case .weakUnownedMisuse: "Weak/Unowned Misuse"
        case .closureCaptures: "Closure Captures"
        case .arcPitfalls: "ARC Pitfalls"
        case .deinitNotCalled: "deinit Not Called"
        }
    }
}

nonisolated extension ConcurrencySubcategory {
    var name: String {
        switch self {
        case .actorIsolation: "Actor Isolation"
        case .raceConditions: "Race Conditions"
        case .taskMisuse: "Task Misuse"
        case .asyncAwaitErrors: "Async/Await Errors"
        case .sendableViolations: "Sendable Violations"
        }
    }
}

nonisolated extension APIDesignSubcategory {
    var name: String {
        switch self {
        case .namingClarity: "Naming Clarity"
        case .accessControl: "Access Control"
        case .leakingInternals: "Leaking Internals"
        case .functionSignatures: "Function Signatures"
        case .protocolMisuse: "Protocol Misuse"
        }
    }
}
