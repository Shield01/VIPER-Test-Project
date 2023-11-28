//
//  WelcomeViewPresenter.swift
//  VIPER Test Project
//
//  Created by Hussein Tijani on 27/11/2023.
//

import Foundation

protocol WelcomeViewPresenterProtocol : AnyObject {
    var view : WelcomeViewControllerProtocol? { get set }
    var interactor : WelcomeViewInteractorProtocol? { get set }
    var router : WelcomeViewRouterProtocol? { get set }
    func welcomeViewInteractorDidFetchUsers(with result : Result<[User], Error>)
}

class WelcomeViewPresenter : WelcomeViewPresenterProtocol {
    
    var router: WelcomeViewRouterProtocol?
    
    weak var view: WelcomeViewControllerProtocol?
    
    var interactor: WelcomeViewInteractorProtocol?
    
    func welcomeViewInteractorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.updateWelcomeLabelContent(with : users)
        case .failure:
            let user = User(name: "Dummy welcomw")
            view?.updateWelcomeLabelContent(with: [user])
        }
    }
    
    init(){
        print("Instantiating Presenter")
        interactor?.getUsers()
    }
}

