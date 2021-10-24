//
//  ViewController.swift
//  DelegateAndProtocol
//
//  Created by New Account on 10/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel : UILabel!
    @IBOutlet weak var mainButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(){
        let nextView = storyboard?.instantiateViewController(withIdentifier: "SelectionView") as! SelectionViewController
        nextView.modalPresentationStyle = .fullScreen
        nextView.selectionDelegate = self
        present(nextView, animated: true, completion: nil)
    }

}

extension ViewController : nameSelectionDelegate {
    func didTapOnButton(inputName: String, colorOfText: UIColor) {
        mainLabel.text = inputName
        mainLabel.backgroundColor = colorOfText
    }
    
    
}
