//
//  Subcategory+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

nonisolated extension ProgrammingPrincipleSubcategory {
    var promptHint: String {
        switch self {
        case .solid: "a Swift class that violates one of the SOLID principles — e.g. a class doing too much, or a subclass breaking its parent's contract"
        case .dry: "a Swift class or struct with duplicated logic that should be extracted into a shared function or property"
        case .yagni: "a Swift class with unnecessary abstractions or unused flexibility added before it was needed"
        case .kiss: "a Swift function that solves a simple problem with needlessly complex logic or structure"
        case .separationOfConcerns: "a Swift class that mixes unrelated responsibilities, such as networking and UI logic in the same type"
        }
    }
}

nonisolated extension LogicControlFlowSubcategory {
    var promptHint: String {
        switch self {
        case .offByOne: "a Swift function with a loop or index calculation that is off by one"
        case .optionalMisuse: "a Swift function that mishandles an optional — either force-unwrapping unsafely or failing to check for nil"
        case .missingGuardClause: "a Swift function with deeply nested conditionals where an early return via guard would prevent incorrect execution"
        case .forceUnwrap: "a Swift function that force-unwraps an optional that could be nil at runtime"
        case .conditionError: "a Swift function with an incorrect boolean condition — using || instead of &&, or an inverted comparison"
        }
    }
}

nonisolated extension MemoryManagementSubcategory {
    var promptHint: String {
        switch self {
        case .retainCycles: "two Swift classes that hold strong references to each other, preventing ARC from deallocating either"
        case .weakUnownedMisuse: "a Swift class that uses weak or unowned incorrectly — either using unowned on an object that can be nil, or using weak where strong ownership is required"
        case .closureCaptures: "a Swift class where a stored closure captures self strongly, creating a retain cycle that prevents deallocation"
        case .arcPitfalls: "a Swift class where an object is never deallocated due to an accidental strong reference — such as a delegate or callback holding a strong reference to its owner"
        case .deinitNotCalled: "two Swift classes where a reference cycle prevents deinit from being called on either object"
        }
    }
}

nonisolated extension ConcurrencySubcategory {
    var promptHint: String {
        switch self {
        case .actorIsolation: "a Swift actor whose isolated state is accessed incorrectly from outside the actor without await"
        case .raceConditions: "a Swift class where shared mutable state is accessed from multiple tasks without synchronization, causing a data race"
        case .taskMisuse: "a Swift function that creates a Task incorrectly — such as ignoring cancellation, or using Task.detached when structured concurrency is appropriate"
        case .asyncAwaitErrors: "a Swift async function that misuses await — such as performing sequential awaits that should be concurrent, or calling async code without await"
        case .sendableViolations: "a Swift class passed across actor boundaries that contains non-Sendable mutable state"
        }
    }
}

nonisolated extension APIDesignSubcategory {
    var promptHint: String {
        switch self {
        case .namingClarity: "a Swift function or type with misleading or unclear names that do not reflect their actual behavior"
        case .accessControl: "a Swift class that exposes internal implementation details as public — properties or methods that should be private or internal"
        case .leakingInternals: "a Swift struct or class whose public interface exposes concrete implementation types that should be hidden behind a protocol or abstraction"
        case .functionSignatures: "a Swift function with a poorly designed signature — too many parameters, wrong parameter labels, or a return type that forces callers to do extra work"
        case .protocolMisuse: "a Swift protocol used where a concrete type or simpler abstraction would be clearer — such as a protocol with a single conformer or unnecessary associated types"
        }
    }
}
