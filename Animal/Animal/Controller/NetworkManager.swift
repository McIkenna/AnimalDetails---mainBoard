//
//  NetworkManager.swift
//  Animal
//
//  Created by New Account on 10/23/21.
//
import Foundation

struct AnimalNetworkManager {
    func getAnimals (completionhandler: @escaping (AnimalDataModel?) -> ()){
        let animalUrl = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")!
        URLSession.shared.dataTask(with: animalUrl) {(data, response, error) in
            if (error == nil && data != nil){
                do {
                    let result = try JSONDecoder().decode(AnimalDataModel.self, from: data!)
                    completionhandler(result)
                }
                catch let error{
                    print(error)
                }
            }
        }.resume()
    }
}
