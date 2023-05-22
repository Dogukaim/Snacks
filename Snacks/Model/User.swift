//
//  User.swift
//  Snacks
//
//  Created by Dogukaim on 20.05.2023.
//

import Foundation


struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birhtdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
