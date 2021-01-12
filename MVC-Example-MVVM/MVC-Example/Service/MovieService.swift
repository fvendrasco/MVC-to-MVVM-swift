//
//  MovieService.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

import Foundation

protocol MovieServiceProtocol {
    func getMovie(name: String, completionHandler: @escaping (_ movie: Movie) -> Void, failure: (_ error: String) -> Void)
}

class MovieService: MovieServiceProtocol {
    
    private var movies = [Movie]()
    
    init() {
        movies.append(Movie(title: "Avengers", releaseDay: 10, releaseMonth: 12, releaseYear: 2019))
        movies.append(Movie(title: "Avengers 2", releaseDay: 10, releaseMonth: 09, releaseYear: 2018))
    }
    
    func getMovie(name: String, completionHandler: @escaping (Movie) -> Void, failure: (String) -> Void) {
        if let movie = movies.filter({ $0.title == name}).first {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completionHandler(movie)
            }
        } else {
            failure("não foi encotrado nenhum filme")
        }
    }
}
