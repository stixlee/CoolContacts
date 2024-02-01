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
                    .cornerRadius(15)
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
            .padding([.leading, .trailing], 18)
            .scrollIndicators(.hidden)
            .listStyle(.grouped)
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text("Could Not Load Employees"), message: Text("Too Many Requests"), dismissButton: .default(Text("Got it!")))
            }
            .sheet(isPresented: $viewModel.presentAddEmployee) {
                AddEmployeeView(viewModel: viewModel)
            }
            .navigationTitle("Employees")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addEmployee()
                    } label: {
                        Image(systemName: "plus")
                            .font(.headline)
                            .foregroundStyle(Color.primaryForeground)
                    }
                }
            }

        }
        .refreshable() {
            do {
               try await viewModel.loadData()
            } catch {
                viewModel.showError.toggle()
            }

        }
        .task {
            do {
               try await viewModel.loadData()
            } catch {
                viewModel.showError.toggle()
            }
        }
    }
}

#Preview {
    EmployeesView()
}
