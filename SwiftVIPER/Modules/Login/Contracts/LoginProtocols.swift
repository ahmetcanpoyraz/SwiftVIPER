//
//  LoginProtocols.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation
import UIKit


// MARK: - View
protocol LoginViewProtocol: AnyObject {
    func showError(message: String)
}

// MARK: - Presenter
protocol LoginPresenterProtocol: AnyObject {
    func didTapLoginButton(email: String, password: String)
}

// MARK: - Interactor
protocol LoginInteractorProtocol: AnyObject {
    var presenter: LoginInteractorOutputProtocol? { get set }
    func login(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func loginSuccess()
    func loginFailed(error: String)
}

// MARK: - Router
protocol LoginRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToHome()
}
