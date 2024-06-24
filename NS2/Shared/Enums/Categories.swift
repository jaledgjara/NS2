//
//  Categories.swift
//  NS2
//
//  Created by Jaled Jara on 6/11/24.
//

import Foundation

enum Categories: String, CaseIterable, Codable {
    
    case firstAid = "First Aid"
    case fitness = "Fitness"
    case perfumery = "Perfumery"
    case womansHealth = "Woman´s Health"
    case mensHealth = "Men's Health"
    case gifts = "Gifts"
    case creams = "Creams"

    
    var id: String { self.rawValue }
    
    var imageName: String {
            switch self {
            case .firstAid:
                return "cross.case.fill"
            case .fitness:
                return "figure.walk"
            case .perfumery:
                return "sparkles"
            case .womansHealth:
                return "heart.circle.fill"
            case .mensHealth:
                return "person.crop.circle"
            case .gifts:
                return "gift.fill"
            case .creams:
                return "drop.fill"
            }
    }
    
    var image: String {
        switch self {
        case .firstAid: "firstAid"
        case .fitness: "fitness"
        case .perfumery: "perfumes"
        case .womansHealth: "womans"
        case .mensHealth: "mens"
        case .gifts: "gifts"
        case .creams: "creams"
        }
    }

}
