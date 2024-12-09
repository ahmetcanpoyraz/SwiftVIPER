//
//  LoginPresenter.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?

    func didTapLoginButton(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            view?.showError(message: "Please fill in all fields.")
            return
        }
        interactor?.login(email: email, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginSuccess() {
            self.router?.navigateToHome()
    }

    func loginFailed(error: String) {
        view?.showError(message: error)
    }
}
