//
//  MainViewModel.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

import Foundation

protocol MainViewModelDelegate {
    func reloadData(movie: MovieViewData)
}

class MainViewModel {
    
    // MARK: - Properts
    private let client: MovieServiceProtocol
    var viewData: Bindable<MovieViewData?> = Bindable(nil)
    var delegate: MainViewModelDelegate?
    
    // MARK: - Constructors
    init(client: MovieServiceProtocol = MovieService()) {
        self.client = client
    }
    
    // MARK: - Methods
    func loadMovie() {
        client.getMovie(name: "Avengers") { (movie) in
            //self.viewData.value = MovieViewData(model: movie)
            self.delegate?.reloadData(movie: MovieViewData(model: movie))
        } failure: { (error) in
            print(error)
        }
    }
}
