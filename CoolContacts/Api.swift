//
//  Api.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

// MARK: Singleton Api Service
let api = Api.shared

final class Api: AbstractApi  {
    
    fileprivate static let shared: AbstractApi = Api()
    
    private init() { }
}
