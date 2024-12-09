//
//  LoginRouter.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LoginRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToHome() {
        let homeViewController = UIViewController() // Replace with actual Home module
        homeViewController.view.backgroundColor = .green
        homeViewController.title = "Home"
        viewController?.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
