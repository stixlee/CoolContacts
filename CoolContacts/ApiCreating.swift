//
//  ApiCreating.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

protocol ApiCreating {
    func addEmployee(employee: Employee) async throws -> Bool
}

