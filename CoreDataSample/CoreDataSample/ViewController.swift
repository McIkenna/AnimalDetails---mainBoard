//
//  ViewController.swift
//  CoreDataSample
//
//  Created by New Account on 10/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createEmployee()
        fetchEmployeeRecords()
    }

    func createEmployee(){
        let employee = Employee(context: PersistenceStorage.shared.context)
        employee.address = "1750 Exchange Road"
        employee.name = "Kenneth"
        PersistenceStorage.shared.saveContext()
    }
    
    func fetchEmployeeRecords (){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(path[0])
        
        do{
            guard let results = try PersistenceStorage.shared.context.fetch(Employee.fetchRequest()) as? [Employee] else {
                return
            }
            results.forEach({debugPrint($0.name ?? "No Name" , $0.address ?? "No Address")})
        }
        catch {
            print(error)
        }
    }

}

