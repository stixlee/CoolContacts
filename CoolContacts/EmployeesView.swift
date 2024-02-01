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
                            EmployeeDetailsView(
                                viewModel: EmployeeViewModel(employee: employee)
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } label: {
                            EmployeeCell(
                                viewModel: EmployeeViewModel(employee: employee)
                            )
                        }
                    }
                    .cornerRadius(15)
                }
                Section(header: Text("Mid-Level Employees")) {
                    ForEach(viewModel.midlevelEmployees, id: \.id) { employee in
                        NavigationLink() {
                            EmployeeDetailsView(
                                viewModel: EmployeeViewModel(employee: employee)
                            )
                       } label: {
                           EmployeeCell(
                               viewModel: EmployeeViewModel(employee: employee)
                           )
                       }
                    }
                }
                Section(header: Text("Junior Employees")) {
                    ForEach(viewModel.juniorEmployees, id: \.id) { employee in
                        NavigationLink() {
                            EmployeeDetailsView(
                                viewModel: EmployeeViewModel(employee: employee)
                            )
                        } label: {
                            EmployeeCell(
                                viewModel: EmployeeViewModel(employee: employee)
                            )
                        }
                    }
                }


            }
            .scrollIndicators(.hidden)
            .listStyle(.grouped)
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text(viewModel.errorName), message: Text(viewModel.errorDescription), dismissButton: .default(Text("Got it!")))
            }
            .sheet(isPresented: $viewModel.presentAddEmployee) {
                AddEmployeeView(viewModel: viewModel, isPresented: $viewModel.presentAddEmployee)
            }
            .navigationTitle("Employees")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.openAddEmployee()
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
                DispatchQueue.main.async {
                    viewModel.errorName = "Error Loading Data"
                    viewModel.errorDescription = "Too Many Requests"
                    viewModel.showError.toggle()
                }
            }

        }
        .task {
            if viewModel.isLoaded { return }
            viewModel.isLoaded = true
            do {
               try await viewModel.loadData()
            } catch {
                DispatchQueue.main.async {
                    viewModel.errorName = "Error Loading Data"
                    viewModel.errorDescription = "Too Many Requests"
                    viewModel.showError.toggle()
                }
            }
        }
    }
}

#Preview {
    EmployeesView()
}
