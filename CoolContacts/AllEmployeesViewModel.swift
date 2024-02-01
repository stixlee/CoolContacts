//
//  AllContactsViewModel.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// MARK: Info

/*
View Model for collection of employees
loaded from server
 */

// Mark: View State
@Observable final class AllEmployeesViewModel: ObservableObject {
    
    var employees: [Employee] = []
    var showError: Bool = false
    var presentAddEmployee: Bool = false
    var isLoaded = false
    var errorName = ""
    var errorDescription = ""
    
    private var lastId: Int = 100
}

// Mark: Functions
extension AllEmployeesViewModel {
    
    func loadData() async throws {
        let employees = try await api.fetchEmployees()
        await update(with: employees)
    }
    
    func openAddEmployee() {
        print("DEBUG: Adding Employee")
        presentAddEmployee.toggle()
    }
    
    func addEmployee(employee: Employee) {
        withAnimation(.smooth) {
            employees.append(employee)
        }
        Task {
            do {
                let _ = try await api.addEmployee(employee: employee)
            } catch {
                DispatchQueue.main.async {
                    self.errorName = "Error Adding Employee"
                    self.errorDescription = "Action Not Supported"
                    self.showError.toggle()
                }
            }
        }
    }

    @MainActor
    func update(with dao: EmployeesResponseDAO) async {
        let contacts = dao.employees
        var list: [Employee] = []
        for contact in  contacts {
            list.append(Employee(from: contact))
        }
        withAnimation(.smooth) {
            employees = list
        }
    }
}

// Mark: Computed Properties
extension AllEmployeesViewModel {
    
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
    
    var nextId: Int {
        lastId += 1
        return lastId
    }
    
}
