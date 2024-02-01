//
//  EmployeeDAO.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

struct EmployeeDAO: Codable {
    let id: Int
    var name: String
    var salary: Int
    var age: Int
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case image = "profile_image"
    }
    
    init(id: Int, name: String, salary: Int, age: Int, image: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.image = image
    }
    
    init(from model: Employee) {
        self.id = model.id
        self.name = model.name
        self.salary = model.salary
        self.age = model.age
        self.image = model.image
    }

}
