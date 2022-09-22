//
//  AddSpot.swift
//  Landmarks
//
//  Created by Cyril with help of https://www.youtube.com/watch?v=Zb3fbj0gNdw

import UIKit

func AddSpot(_ name: String, _ city: String, _ description: String) {
    let longitutde: Double = 102.14608983929037
    let latitude:   Double = 19.871288047261494
    //  let urlApi:String = "http://localhost:8080/api/urbex"  // il faut lancer go run . depuis le repertoir API
       let urlApi:String = "https://testgovercel-urbexspots-urbex-spots.vercel.app/api/getall" // heberge sur Vercel Cyril
    
    do {
        guard let url = URL(string: urlApi) else { return }
        let body : [String:Any]  = [
            "Name": name,
            "City": city,
            "Description": description,
            "Longitude": longitutde,
            "Latitude": latitude,
            "ImageName": "belakissscreen"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Something went wrong with the request: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data found.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(CreateUserResponse.self, from: data)
                print(result)
            } catch let error {
                print("Cannot convert the response to the required objects: \(error.localizedDescription)")
            }
            
        }.resume()
        
    } catch let error {
        print("Error : \(error.localizedDescription)")
    }
    
}

struct CreateUserResponse: Decodable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}


//let button = UIButton(type: UIButtonType.Custom) as UIButton
//  button.addTarget(self, action: "action:", forControlEvents: UIControlEvents.TouchUpInside)
//
//func action(sender:UIButton!) {
//   print("Button Clicked")
//}
