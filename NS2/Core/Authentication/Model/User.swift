//
//  User.swift
//  NS2
//
//  Created by Jaled Jara on 5/29/24.
//

import Foundation

struct User: Identifiable, Codable{
    var id: String
    var username: String
    var email: String
    var address: String?
    var phoneNumber: String?
}

