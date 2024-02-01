//
//  ContactsView.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

struct EmployeesView: View {
    
    @StateObject var viewModel: AllEmployeesViewModel = AllEmployeesViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Senior Employees")) {
                    ForEach(viewModel.seniorEmployees, id: \.id) { employee in
                        NavigationLink() {
                            Text(employee.name)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } label: {
                            EmployeeCell(viewModel: employee)
                        }
                    }
                }
                Section(header: Text("Mid-Level Employees")) {
                    ForEach(viewModel.midlevelEmployees, id: \.id) { employee in
                        NavigationLink() {
                            Text(employee.name)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } label: {
                            EmployeeCell(viewModel: employee)
                        }
                    }
                }
                Section(header: Text("Junior Employees")) {
                    ForEach(viewModel.juniorEmployees, id: \.id) { employee in
                        NavigationLink() {
                            Text(employee.name)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } label: {
                            EmployeeCell(viewModel: employee)
                        }
                    }
                }


            }
            .listStyle(.grouped)
            .navigationTitle("Employees")
        }
        .refreshable() {
            do {
               try await viewModel.loadData()
            } catch {
                print("ERROR")
            }

        }
        .task {
            do {
               try await viewModel.loadData()
            } catch {
                print("ERROR")
            }
        }
    }
}

#Preview {
    EmployeesView()
}
