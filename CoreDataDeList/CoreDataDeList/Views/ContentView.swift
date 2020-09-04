//
//  ContentView.swift
//  CoreDataDeList
//
//  Created by Adri Nofrianto on 03/09/20.
//  Copyright © 2020 Adri Nofrianto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: DeListItem.getAllDeListItems()) var deListItems:FetchedResults<DeListItem>
    
    @State private var newDeListItem = ""
    
    
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What next")) {
                    HStack{
                        TextField("New list", text:  self.$newDeListItem)
                        Button(action: {
                            let deListItem = DeListItem(context: self.context)
                            deListItem.title = self.newDeListItem
                            deListItem.createdAt = Date()
                            
                            
                            do {
                                try self.context.save()}
                            catch{
                                print(error)
                            }
                            self.newDeListItem = ""
                        }){
                            Image(systemName: "plus")
                            
                                
                                .imageScale(.large)
                            }
                        }
                } .font(.headline)
                Section(header: Text("De List's")){
                    ForEach(self.deListItems) {deListItem in
                        DeListItemView(title: deListItem.title!, createdAt: "\(deListItem.createdAt!)")
                    }.onDelete {indexSet in
                        let deleteItem = self.deListItems[indexSet.first!]
                        self.context.delete(deleteItem)
                        
                        do {
                            try self.context.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("My List"))
        .navigationBarItems(trailing: EditButton())
        }
    }

}



