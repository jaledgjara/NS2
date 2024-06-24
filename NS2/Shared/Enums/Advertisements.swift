//
//  Advertisements.swift
//  NS2
//
//  Created by Jaled Jara on 6/11/24.
//

import Foundation
import SwiftUI
    
enum Advertisements: String, CaseIterable, Identifiable {
    case one
    case two
    case three
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .one:
            return "Special Discount"
        case .two:
            return "Health Tips"
        case .three:
            return "Save More"
        }
    }
    
    var description: String {
        switch self {
        case .one:
            return "Get up to 50% off on selected items. Limited time offer!"
        case .two:
            return """
            Regular exercise, a balanced diet, and staying hydrated are essential for good health.
            Visit our pharmacy for more health tips and products that can help you maintain a healthy lifestyle.
            """
        case .three:
            return "Use code SAVE20 to get 20% off on your next purchase of vitamins and supplements."
        }
    }
    
    var color: Color {
        switch self {
        case .one:
            return .greenP
        case .two:
            return .orangeP
        case .three:
            return .blueP
        }
    }
}
