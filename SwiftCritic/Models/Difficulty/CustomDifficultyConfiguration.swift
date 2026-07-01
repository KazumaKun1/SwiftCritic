//
//  CustomDifficultyConfiguration.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

nonisolated struct CustomDifficultyConfiguration: Codable {
    var subtlety: Subtlety
    var snippetLength: SnippetLength
    var hasRedHerrings: Bool
}
