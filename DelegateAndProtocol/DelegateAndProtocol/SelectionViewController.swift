//
//  SelectionViewController.swift
//  DelegateAndProtocol
//
//  Created by New Account on 10/22/21.
//

import UIKit

protocol nameSelectionDelegate {
    func didTapOnButton(inputName: String, colorOfText: UIColor)
}

class SelectionViewController: UIViewController {
    
   

    @IBOutlet weak var myTextField : UITextField!
    var selectionDelegate : nameSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickSecondButton(){
        let textColor : UIColor = .yellow
        selectionDelegate.didTapOnButton(inputName: myTextField.text ?? "No data", colorOfText: textColor)
        
        dismiss(animated: true, completion: nil)
    }

}
