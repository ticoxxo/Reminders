//
//  Priority.swift
//  Reminders
//
//  Created by Alberto Almeida on 09/09/24.
//

import SwiftUI

enum Priority: String, CaseIterable, CustomStringConvertible {
    case none
    case low
    case medium
    case high
    
    var description: String {
        self.rawValue.capitalized
    }
    
    var shortDescription: String {
        switch self {
        case .none: ""
        case .low: "!"
        case .medium: "!!"
        case .high: "!!!"
        }
    }
    
    static let allDescriptions = Self.allCases.map { $0.description }
}
