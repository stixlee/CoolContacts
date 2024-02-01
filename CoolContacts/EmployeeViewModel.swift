//
//  EmployeeViewModel.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// Mark: View State
@Observable final class EmployeeViewModel: ObservableObject {
    
    var employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
}

