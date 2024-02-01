//
//  EmployeeDetailsView.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// MARK: Info

/*
View for viewing details of an employee
 */
struct EmployeeDetailsView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                IdentityView(viewModel: viewModel)
                DetailsView(viewModel: viewModel)
                    .padding(.top, 24)
                Spacer()
            }
            
        }
        .ignoresSafeArea()

        
        //Bottom Details
        
    }
}

#Preview {
    EmployeeDetailsView(viewModel: EmployeeViewModel(
        employee: Employee(id: 2,
                           name: "Stix Lee",
                           salary: 150000,
                           age: 62,
                           image: "")
        )
    )
}
