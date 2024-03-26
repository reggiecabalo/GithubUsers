//
//  GithubUserViewModel.swift
//  GitbhubUser
//
//  Created by Reggie Cabalo on 3/26/24.
//

import Foundation
enum Errors: Error {
    case urlError
}

class GithubUserService {
    func fetchAllUser() async throws -> [GithubUser] {
        let baseURL = "https://api.github.com/users"
        
        guard let url = URL(string: baseURL) else {
            throw Errors.urlError
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        //decoding
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([GithubUser].self, from: data)
        }
    
    }
}
