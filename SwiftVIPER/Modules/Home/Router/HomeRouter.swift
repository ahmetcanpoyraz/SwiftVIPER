//
//  HomeRouter.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    var entry : EntryPoint? { get set }
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter{
    var entry: (any EntryPoint)?
    
    static func startExecution() -> any AnyRouter {
        let router = CryptoRouter()
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        return router
    }
}
