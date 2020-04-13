//
//  UsersView.swift
//  JSONPlaceholder
//
//  Created by JD Patel on 13/04/20.
//  Copyright © 2020 JD. All rights reserved.
//

import SwiftUI
import Combine

struct UsersView : View {
    
    @ObservedObject var apiManager: APIManager
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(self.apiManager.users, id: \.id) { user in
                    
                    UserCell(user: user)
                        
                }
                
            }.listStyle(GroupedListStyle())
                .onAppear {
                    self.apiManager.getUsers()
            }
                
            .navigationBarTitle(Text("Users"))
            
        }
        
    }
    
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(apiManager: APIManager())
    }
}

