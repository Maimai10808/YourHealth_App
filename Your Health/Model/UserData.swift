//
//  UserData.swift
//  Your Health
//
//  Created by mac on 3/14/25.
//

import Foundation


struct User: Codable {
    
    var Name = ""
    var Height = ""
    var Weight = ""
    var birthdate = Date()
    var age = "0"
    var gender = "Not specified"
    var email = ""
    var Requests1 = false
    var Requests2 = false
    var Requests3 = false
    
    
}

