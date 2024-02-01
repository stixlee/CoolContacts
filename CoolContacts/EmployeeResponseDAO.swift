//
//  EmployeeResponseDAO.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

struct EmployeeResponseDAO: Codable {
    let status: String
    let data: EmployeeDAO
    let message: String
}
