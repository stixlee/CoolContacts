//
//  SwiftUIView.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

// MARK: Info

/*
 Top section of EmployeeDetailView
 */
struct DetailsView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            NameCell(name: viewModel.employee.name)
            AgeCell(age: viewModel.employee.age)
            SalaryCell(salary: viewModel.employee.salary)
        }
        .padding([.leading, .trailing], 12)
        .background(.clear)
    }
}

#Preview {
    DetailsView(viewModel: EmployeeViewModel(
        employee: Employee(id: 2,
                           name: "Stix Lee",
                           salary: 150000,
                           age: 62,
                           image: "")
        )
    )
}
