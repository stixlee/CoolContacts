//
//  EmployeeResponseDAO.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

// MARK: Info

/*
 Data Access Object when fetching an employee
 */
struct EmployeeResponseDAO: Codable {
    let status: String
    let employee: EmployeeDAO
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case employee = "data"
        case message = "message"
    }

}
