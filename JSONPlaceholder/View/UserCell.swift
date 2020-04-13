//
//  UserCell.swift
//  JSONPlaceholder
//
//  Created by JD Patel on 13/04/20.
//  Copyright © 2020 JD. All rights reserved.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        
        HStack {
            
            ImageViewContainer(withURL: "https://picsum.photos/id/\(Int.random(in: 300..<325))/60/60")//albumDetails.thumbnailUrl)
                .shadow(radius: 3)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(user.name)
                    .bold()
                
                Text(user.company.name)
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
        }
        
    }
    
}

