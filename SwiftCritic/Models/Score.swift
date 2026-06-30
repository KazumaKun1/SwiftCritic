//
//  Score.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

nonisolated struct Score: Codable {
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    var rating: Rating {
        switch value {
        case 90...100: .excellent
        case 70..<90: .good
        case 50..<70: .fair
        default: .needsImprovement
        }
    }
    
    enum Rating {
        case excellent
        case good
        case fair
        case needsImprovement
    }
}
