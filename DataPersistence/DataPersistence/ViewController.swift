//
//  ViewController.swift
//  DataPersistence
//
//  Created by New Account on 10/25/21.
//

import UIKit
import SQLite3
class ViewController: UIViewController , UITableViewDataSource{
    @IBOutlet weak var personTable : UITableView!
    var persons : [Person] = []
    var db: DBHelper = DBHelper()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //userDefaults()
        //fetchDataFromFile()
        personTable.register(UITableViewCell.self, forCellReuseIdentifier: "mySqlCell")
        personTable.dataSource = self
        db.insert(id: 1, name: "Swift", age: 7)
        db.insert(id: 2, name: "Objective-C", age: 20)
        db.insert(id: 3, name: "Python", age: 50)
        db.insert(id: 4, name: "Java", age: 100)
        persons = db.read()
    }

    //SQLiteLearning

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "mySqlCell")!
        
        cell.textLabel?.text = "Name : " + persons[indexPath.row].name + " " + String(persons[indexPath.row].age)
        return cell
    }
    
}
    /*
    func userDefaults(){
        //Store value in defaults
        let defaults = UserDefaults.standard
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UserToachId")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        //Retrieving from userdefaults
        print("User defaults stored values ----> \(defaults.value(forKey: "Pi") ?? 0)")
        
        let array = ["Hello", "Swift"]
        
        defaults.set(array, forKey: "SavedArray")
        print("User defaults stored values ----> \(defaults.value(forKey: "SavedArray") ?? 0)")
        
    }

    //Plist
    func fetchDataFromPlist(){
        let plistData = Bundle.main.infoDictionary!["Scene Configuration"]
        print("Plist Content ----> \(plistData)")
    }
    
    //FileManager
    func fetchDataFromFile(){
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in:  .userDomainMask).first else {
            return
        }
        print("Path ----> \(url)")
        
        // create a directory
        
        let newFolderPath = url.appendingPathComponent("IOS-Learning")
        do {
            try manager.createDirectory(atPath: newFolderPath.path, withIntermediateDirectories: true, attributes: [:])
        }
        catch {
            print(error)
        }
        
        //create a file
        
        let filePath = newFolderPath.appendingPathComponent("TextFile.txt")
        let newText = "Writng some test data to the file locally!!".data(using: .utf8)
        
        manager.createFile(atPath: filePath.path, contents: newText, attributes: [FileAttributeKey.creationDate : Date()])
        
        print("File path ---> \(filePath)")
        
        //Delete a file
        
        if(manager.fileExists(atPath: filePath.path)){
            print("Deleting a file ---------")
            
            do {
                try manager.removeItem(atPath: filePath.path)
            }
            catch {
                print(error)
            }
        }
    }
    */
    




//Create DB helper class
