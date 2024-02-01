//
//  AddEmployeeDao.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import Foundation

// MARK: Info

/*
 Data Access Object POSTed to server when adding employee
 */
struct AddEmployeeDao: Codable {
    let name: String
    let salary: String
    let age: String
    
    init(from employee: Employee) {
        self.name = employee.name
        self.salary = "\(employee.salary)"
        self.age = "\(employee.age)"
    }
}
