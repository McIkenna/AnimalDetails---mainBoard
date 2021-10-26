//
//  ViewController.swift
//  PersistingData - Assignment
//
//  Created by New Account on 10/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField : UITextField!
    @IBOutlet weak var ageField : UITextField!
    @IBOutlet weak var errorLabel : UILabel!
    @IBOutlet weak var button : UIButton!
    var newId : Int = 0
    var dataBase: DatabaseService = DatabaseService()
    //var userInfo : [PersonInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.text = ""
        sendToDatabase()
    }

    
    @IBAction func sendToDatabase(){
        newId = newId + 1
        let assignedId = newId
        let username : String? = usernameField.text!
        let age : Int?  = Int(ageField.text!)
       
        if(username! != ""){
        dataBase.insert(id: assignedId, username: username!, age: age ?? 0)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tableList = storyboard.instantiateViewController(withIdentifier: "TableNC")
                tableList.modalPresentationStyle = .fullScreen
                present(tableList, animated: true, completion: nil)
                
        }
       
    }

}

