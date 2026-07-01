//
//  CodeIssue.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import FoundationModels

@Generable
struct CodeIssue {
    @Guide(description: "Clear description of the issue and why it is a problem.")
    var description: String
    
    @Guide(description: "A specific line number only. Format: 'line 7'. Never use a function name, variable name, or description. Must be a number.")
    var lineHint: String
    
    @Guide(description: "Severity of the issue: Minor, Major, or Critical.")
    var severity: String
    
    @Guide(description: "How visible the issue is: Surface, Subtle, or Hidden.")
    var visibilityLevel: String
}
