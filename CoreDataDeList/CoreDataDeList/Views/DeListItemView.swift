//
//  DeListItemView.swift
//  CoreDataDeList
//
//  Created by Adri Nofrianto on 03/09/20.
//  Copyright © 2020 Adri Nofrianto. All rights reserved.
//

import SwiftUI

struct DeListItemView: View {
    var title:String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
        
    }
}


