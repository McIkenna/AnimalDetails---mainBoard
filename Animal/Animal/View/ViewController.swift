//
//  ViewController.swift
//  Animal
//
//  Created by New Account on 10/23/21.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   @IBOutlet weak var myTableView : UITableView!
    var animalData : AnimalNetworkManager = AnimalNetworkManager()
    var animal : [Animal]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        loadDataOnView()
    }
    
    func setupUI(){
        self.view.addSubview(myTableView)
        myTableView.dataSource = self
        myTableView.delegate = self
        let customNib = UINib(nibName: "AnimalCell", bundle: nil)
       myTableView.register(customNib, forCellReuseIdentifier: "AnimalCell")
      
    }
    
    func loadDataOnView(){
        animalData.getAnimals(completionhandler: {(_animalData) in
            if(_animalData?.animals != nil){
                self.animal = _animalData?.animals
                
                DispatchQueue.main.async{
                    self.myTableView.reloadData()
                }
            }
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animal?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath) as! AnimalCell
        let animalObj = self.animal?[indexPath.row]
        cell.animalName.text = animalObj?.name
        let animalImageUrl = URL(string: (animalObj?.image)!)!
       let animalImageData = try? Data(contentsOf: animalImageUrl)
        cell.animalImage.image = UIImage(data: animalImageData!)
       // cell.animalImage.loadImage(fromURL: animalImageUrl, placeHolderImage: "previewImage")
     
        return cell
    }

  
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let controller = storyboard.instantiateViewController(withIdentifier: "AnimalDetailView") as! AnimalDetail
      let animalObj = animal?[indexPath.row]
      let animalImageUrl = URL(string: (animalObj?.image)!)!
      let animalImageData = try? Data(contentsOf: animalImageUrl)
      controller.label = animalObj?.name
      controller.image = UIImage(data: animalImageData!)
      controller.modalPresentationStyle = .fullScreen
      present(controller, animated: true, completion: nil)
    }
    
   
  
    
    
}


