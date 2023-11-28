//
//  WelcomeViewRouter.swift
//  VIPER Test Project
//
//  Created by Hussein Tijani on 27/11/2023.
//

import UIKit

typealias welcomeEntryPoint = WelcomeViewControllerProtocol & UIViewController

protocol WelcomeViewRouterProtocol {
    var entryPoint : welcomeEntryPoint? { get }
    static func createModule() -> WelcomeViewRouter
}

class WelcomeViewRouter : WelcomeViewRouterProtocol {
    
    var entryPoint : welcomeEntryPoint?
    
    static func createModule() -> WelcomeViewRouter {
        
        let router = WelcomeViewRouter()
        let view : WelcomeViewControllerProtocol = WelcomeViewController()
        let presenter : WelcomeViewPresenterProtocol = WelcomeViewPresenter()
        let interactor : WelcomeViewInteractorProtocol = WelcomeViewInteractor()
        
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        
        router.entryPoint = view as? welcomeEntryPoint
        
        return router
    }
}

