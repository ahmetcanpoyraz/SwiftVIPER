//
//  HomePresenter.swift
//  SwiftVIPER
//
//  Created by İzmir İnovasyon ve Teknoloji on 9.12.2024.
//

import Foundation


protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto (result: Result<[Crypto],Error>)
}

class CryptoPresenter : AnyPresenter {
    var interactor: (any AnyInteractor)?
    var view: (any AnyView)?
    var router: (any AnyRouter)?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], any Error>) {
        switch result{
        case .success(let cryptos):
            print("update")
        case.failure(let error):
            print("error")

        }
    }
}
