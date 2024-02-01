//
//  EmployeesDAO.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

struct EmployeesResponseDAO: Codable {
    let status: String
    let data: [EmployeeDAO]
    let message: String
    
//    enum CodingKeys: String, CodingKey {
//        case status = "status"
////        case employees = "data"
//        case message = "message"
//    }

}
