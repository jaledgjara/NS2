//
//  Product.swift
//  NS2
//
//  Created by Jaled Jara on 6/11/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    var description: String
    var price: Double
    var category: Categories
    var rating: Int
    var image: String?
}
