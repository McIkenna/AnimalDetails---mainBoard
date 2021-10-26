//
//  PersonInfo.swift
//  PersistingData - Assignment
//
//  Created by New Account on 10/25/21.
//
import UIKit
class PersonInfo{
    var username : String = ""
    var age : Int = 0
    var id : Int = 0
    
    init (id: Int, username: String, age: Int){
        self.id = id
        self.username = username
        self.age = age
    }
}
