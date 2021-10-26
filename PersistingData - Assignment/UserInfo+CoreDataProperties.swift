//
//  UserInfo+CoreDataProperties.swift
//  PersistingData - Assignment
//
//  Created by New Account on 10/26/21.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var userName: String?
    @NSManaged public var age: Int32
    @NSManaged public var id: Int32

}

extension UserInfo : Identifiable {

}
