//
//  LoginInteractor.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    var presenter: LoginInteractorOutputProtocol?

    func login(email: String, password: String) {
        // Simulate an API call
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if email == "test@example.com" && password == "password" {
                self.presenter?.loginSuccess()
            } else {
                self.presenter?.loginFailed(error: "Invalid credentials")
            }
        }
    }
}
