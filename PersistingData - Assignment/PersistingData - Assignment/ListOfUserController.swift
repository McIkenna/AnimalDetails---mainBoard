//
//  ListOfUserController.swift
//  PersistingData - Assignment
//
//  Created by New Account on 10/25/21.
//

import UIKit

class ListOfUserController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var userTable : UITableView!
    
    var user : [PersonInfo] = []
    var db: DatabaseService = DatabaseService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //userDefaults()
        //fetchDataFromFile()
        userTable.register(UITableViewCell.self, forCellReuseIdentifier: "myTableCell")
        userTable.dataSource = self
    
        user = db.read()
    }

    //SQLiteLearning

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myTableCell")!
        
        cell.textLabel?.text = "\(user[indexPath.row].id) : " + user[indexPath.row].username + " " + String(user[indexPath.row].age)
        return cell
    }

   

}
