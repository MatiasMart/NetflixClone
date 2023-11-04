//
//  Extensions.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 04/11/2023.
//

import Foundation

//Function for capitalizing movie titles

extension String {
    func capitalizingFirstLetters() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
