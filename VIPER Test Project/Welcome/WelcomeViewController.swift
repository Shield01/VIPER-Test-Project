//
//  WelcomeViewController.swift
//  VIPER Test Project
//
//  Created by Hussein Tijani on 27/11/2023.
//

import UIKit

protocol WelcomeViewControllerProtocol : AnyObject {
    var presenter : WelcomeViewPresenterProtocol? { get set }
    func updateWelcomeLabelContent(with users : [User])
}

class WelcomeViewController : UIViewController {
    
    //MARK: Properties
    
    var presenter: WelcomeViewPresenterProtocol?
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.attributedText = NSAttributedString(string: "Dummy Welcome")
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpConstraints()
    }
    //MARK: Helpers
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
    }
    
    private func setUpConstraints() {
        let welcomeLabelConstraints : [NSLayoutConstraint] = [
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ]
        
        NSLayoutConstraint.activate(welcomeLabelConstraints)
    }
    
    //MARK: Selectors
}

extension WelcomeViewController : WelcomeViewControllerProtocol {
    func updateWelcomeLabelContent(with users: [User]) {
        print(users)
    }
}

