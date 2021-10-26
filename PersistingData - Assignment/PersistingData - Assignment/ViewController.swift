//
//  ViewController.swift
//  PersistingData - Assignment
//
//  Created by New Account on 10/25/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var usernameField : UITextField!
    @IBOutlet weak var ageField : UITextField!
    @IBOutlet weak var errorLabel : UILabel!
    @IBOutlet weak var button : UIButton!
    var dataBase: DatabaseService = DatabaseService()
    //var userInfo : [PersonInfo] = []
    var idToDelete : Int = 0
    @IBOutlet weak var userTable : UITableView!
    
    var user : [PersonInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userTable.register(UITableViewCell.self, forCellReuseIdentifier: "myTableCell")
        userTable.dataSource = self
        userTable.delegate = self
    
        user = dataBase.read()
        dataBase.deleteById(id: 5)
        
    }

    
    @IBAction func sendToDatabase(){
        let assignedId = user.count + 1
        let username : String? = usernameField.text!
        let age : Int?  = Int(ageField.text!)
       
        if(username != "" || age != 0){
        dataBase.insert(id: assignedId, username: username!, age: age ?? 0)
            errorLabel.text = ""
            usernameField.text = " "
            ageField.text = " "
            errorLabel.text = "Entry was successful"
            errorLabel.textColor = .green
        }
        else{
            errorLabel.text = "Invalid User data"
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myTableCell")!
        
        cell.textLabel?.text = "\(user[indexPath.row].id) : " + user[indexPath.row].username + " " + String(user[indexPath.row].age)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idToDelete = indexPath.row
    }
    
}

