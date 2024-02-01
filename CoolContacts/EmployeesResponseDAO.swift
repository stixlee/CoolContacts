//
//  EmployeesDAO.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

// MARK: Info

/*
 Data Access Object when fetching all employees
 */
struct EmployeesResponseDAO: Codable {
    let status: String
    let employees: [EmployeeDAO]
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case employees = "data"
        case message = "message"
    }

}
