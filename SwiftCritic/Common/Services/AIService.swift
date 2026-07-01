//
//  AIService.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import FoundationModels

protocol AIServiceProtocol {
    func generateCode(from configuration: SessionConfiguration) async throws -> CodeChallenge
    func evaluateComments(challenge: CodeChallenge, feedback: CodeFeedback) async throws -> ReviewEvaluation
}

@MainActor
final class AIService: AIServiceProtocol {
    private let generationInstructions: String =
        """
        You are a Flawed Swift code generation assistant for a developer training app.

        Your sole responsibility is to write realistic Swift code snippets that contain intentional, subtle defects for developers to find and review.

        Rules:
        - Write idiomatic, production-style Swift that looks legitimate at first glance
        - Never add comments, names, or hints that reveal where the defects are
        - Defects must be realistic mistakes a real developer could make
        - The code must compile successfully in Swift 6 — all defects must be runtime or logic errors, not syntax errors
        - Do not explain or annotate the issues in the code itself
        - After writing the code, list ONLY the defects you actually introduced — never fabricate issues that are not present in your snippet
        - Zero comment characters in the output — the snippet must not contain a single `//` or `/*` anywhere
        - Use realistic, domain-appropriate type names — never names that reference the category being tested
        - Always write a complete function, method, or class — never loose top-level statements
        - Never exceed 40 lines of code
        """

    private let evaluationInstructions: String =
        """
        You are a Swift code review evaluator for a developer training app.

        You will be given:
        1. A Swift code snippet with intentional defects
        2. The known list of defects that were planted in that code
        3. A developer's review comments

        Your sole responsibility is to evaluate the developer's review against the known defect list.

        Rules:
        - Use ONLY the provided defect list — do not invent or add defects not listed
        - An issue counts as caught only if the developer identified the correct location and described the actual problem
        - Be fair but precise — partial credit is allowed for close-but-incomplete identifications
        - Do not penalize style preferences or opinions that are not actual defects
        - Compare the developer's assigned severity against the known severity and note mismatches
        - The known defect list is complete and authoritative. Never add missed defects that are not in that list.
        """

    func generateCode(from configuration: SessionConfiguration) async throws -> CodeChallenge {
        let newSession = LanguageModelSession(instructions: generationInstructions)

        return try await newSession
            .respond(
                to: configuration.prompt,
                generating: CodeChallenge.self
            ).content
    }
    
    func evaluateComments(challenge: CodeChallenge, feedback: CodeFeedback) async throws -> ReviewEvaluation {
        let newSession = LanguageModelSession(instructions: evaluationInstructions)
        
        return try await newSession
            .respond(
                to: feedback.evaluationPrompt(for: challenge),
                generating: ReviewEvaluation.self
            ).content
    }
}
