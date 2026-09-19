//
//  AccountSummaryViewControllerNetworking.swift
//  Bankey
//
//  Created by Diego Marcolino Santana on 17/09/26.
//

import Foundation
import UIKit

struct Profile: Codable, Sendable {
    
    let id: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

private func decodeProfile(from data: Data) throws -> Profile {
    try JSONDecoder().decode(Profile.self, from: data)
}


extension AccountSummaryViewController {
    
    func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile,NetworkError>) -> Void) {
        let url = URL(string: "https://fierce-retreat-36855.herokuapp.com/bankey/profile/\(userId)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }
            
            do {
                let profile = try JSONDecoder().decode(Profile.self, from: data)
                completion(.success(profile))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
