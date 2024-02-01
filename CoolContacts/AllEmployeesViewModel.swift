//
//  AllContactsViewModel.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

@Observable final class AllEmployeesViewModel: ObservableObject {
    
    var employees: [Employee] = []
    var showError: Bool = false
    var presentAddEmployee: Bool = false
    
    var seniorEmployees: [Employee] {
        var seniorEmployees = employees.filter { $0.age > 40 }
        seniorEmployees.sort { $0.name < $1.name }
        return seniorEmployees
    }
    
    var midlevelEmployees: [Employee] {
        var midlevelEmployees = employees.filter { ($0.age <= 40) && ($0.age > 27) }
        midlevelEmployees.sort { $0.name < $1.name }
        return midlevelEmployees
    }
    
    var juniorEmployees: [Employee] {
        var juniorEmployees = employees.filter { $0.age <= 27 }
        juniorEmployees.sort { $0.name < $1.name }
        return juniorEmployees
    }
    
    func loadData() async throws {
        let employees = try await api.fetchEmployees()
        await update(with: employees)
    }
    
    func addEmployee() {
        print("DEBUG: Adding Employee")
        presentAddEmployee.toggle()
    }

    @MainActor
    func update(with dao: EmployeesResponseDAO) async {
        let contacts = dao.data
        var list: [Employee] = []
        for contact in  contacts {
            list.append(Employee(from: contact))
        }
        withAnimation(.smooth) {
            employees = list
        }
    }
}
