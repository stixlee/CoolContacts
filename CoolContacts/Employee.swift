//
//  Employee.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

@Observable class Employee: Identifiable, ObservableObject {
    let id: Int
    var name: String
    var salary: Int
    var age: Int
    var image: String
    
    init(id: Int, name: String, salary: Int, age: Int, image: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.image = image
    }
    
    init(from dao: EmployeeDAO) {
        self.id = dao.id
        self.name = dao.name
        self.salary = dao.salary
        self.age = dao.age
        self.image = dao.image
    }
}
