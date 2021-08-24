//
//  RequestManager.swift
//  DocuMenu
//
//  Created by Gonzalo Barrios on 8/18/21.
//

import Foundation
import Alamofire

class RequestManager {

    static let sharedInstance = RequestManager()

    func getItems(completion: @escaping (Restaurant?) -> Void) {
        let urlString = "https://api.documenu.com/v2/restaurant/4072702673999819?key=36d89082bf662a38179cd8e33bd4d9af"

        AF.request(urlString)
            .validate()
            .responseJSON { response in
                guard let data = response.data else { return }

            do {
                let decoder = JSONDecoder()
                let restaurantResponse = try decoder.decode(RequestRestaurantResponse.self, from: data)
                completion(restaurantResponse.result)
            }

            catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
