//
//  MainViewData.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

protocol MovieViewDataType {
    var title: String { get }
    var releaseDate: String { get }
}

class MovieViewData {
    
    // MARK: - Properts
    private let model: Movie
    
    // MARK: - Constructors
    init(model: Movie) {
        self.model = model
    }
}

extension MovieViewData: MovieViewDataType {
    
    var title: String {
        return model.title
    }
    
    var releaseDate: String {
        return "\(model.releaseDay)/\(model.releaseMonth)/\(model.releaseYear)"
    }
}
