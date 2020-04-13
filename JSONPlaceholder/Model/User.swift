//
//  User.swift
//  JSONPlaceholder
//
//  Created by JD Patel on 13/04/20.
//  Copyright © 2020 JD. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct User: Codable {
    
    let id: Int
    let name: String
    let company: Company
    
}

struct Company: Codable {
    let name: String
}

