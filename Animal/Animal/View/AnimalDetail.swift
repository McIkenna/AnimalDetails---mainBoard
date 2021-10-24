//
//  AnimalDetail.swift
//  Animal
//
//  Created by New Account on 10/23/21.
//

import Foundation
import UIKit



class AnimalDetail: UIViewController{
    @IBOutlet weak var detailImage : UIImageView!
    @IBOutlet weak var detailLabel : UILabel!
    
    var label : String?
    var image : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = label
        detailImage.image = image
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
    }
    
    @IBAction func goBack(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
        
    
}


