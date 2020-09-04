//
//  DeListItem.swift
//  CoreDataDeList
//
//  Created by Adri Nofrianto on 03/09/20.
//  Copyright © 2020 Adri Nofrianto. All rights reserved.
//

import Foundation
import CoreData

public class DeListItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
    
}
    
extension DeListItem {
    static func getAllDeListItems() -> NSFetchRequest<DeListItem> {
        
        let request:NSFetchRequest<DeListItem> = DeListItem.fetchRequest() as! NSFetchRequest<DeListItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
