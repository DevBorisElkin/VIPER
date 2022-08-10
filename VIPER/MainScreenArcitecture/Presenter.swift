//
//  Presenter.swift
//  VIPER
//
//  Created by test on 10.08.2022.
//

import Foundation

// object
// protocol

// ref to interactor, router, view

enum FetchError: Error {
    case failedToLoad
    case failedToDecode
}

protocol AnyPresenter{
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch(result){
            
        case .success(let users):
            view?.update(with: users)
        case .failure(let error):
            view?.update(with: "Something went wrong")
        }
    }
}
