//
//  ApiFetching.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

protocol ApiFetching {
    func fetchEmployees() async throws -> EmployeesResponseDAO
    func fetchEmployee(id: Int) async throws -> EmployeeResponseDAO
}
