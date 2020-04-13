//
//  APIManager.swift
//  JSONPlaceholder
//
//  Created by JD Patel on 13/04/20.
//  Copyright © 2020 JD. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class APIManager: ObservableObject {
    
    var didChange = PassthroughSubject<Void,Never>()
    
    // MARK :- USER
    
    @Published var users = [User]() {
        didSet {
            didChange.send(())
        }
    }
    
    @State var isLoading: Bool = false
    
    func getUsers() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        print("Get All Users API Calling")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let users = try! JSONDecoder().decode([User].self, from: data)
            DispatchQueue.main.async {
                self.users = users
                self.isLoading = false
            }
            print("\(users.count) Users fetched...!")
            print("--------------------------------")
        }.resume()
        
    }
    
}
