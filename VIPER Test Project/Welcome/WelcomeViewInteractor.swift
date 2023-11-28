//
//  WelcomeViewInteractor.swift
//  VIPER Test Project
//
//  Created by Hussein Tijani on 27/11/2023.
//

import Foundation

enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

enum APIRequestError : Error {
    case InvalidURL
    case RequestBodyEncodingFailed
    case RequestFailed
    case ResponseNotDecodable
}

protocol WelcomeViewInteractorProtocol : AnyObject {
    var presenter : WelcomeViewPresenterProtocol? { get set }
    func getUsers()
}

class WelcomeViewInteractor : WelcomeViewInteractorProtocol{
    weak var presenter: WelcomeViewPresenterProtocol?
    
    func getUsers(){
        print("Getting users")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            self.presenter?.welcomeViewInteractorDidFetchUsers(with: .failure(APIRequestError.InvalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                self.presenter?.welcomeViewInteractorDidFetchUsers(with: .failure(APIRequestError.RequestFailed))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.welcomeViewInteractorDidFetchUsers(with: .success(decodedData))
            }catch{
                self.presenter?.welcomeViewInteractorDidFetchUsers(with: .failure(APIRequestError.ResponseNotDecodable))
            }
        }
        print("About to resume task")
        task.resume()
    }
}

