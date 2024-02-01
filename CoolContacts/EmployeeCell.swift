//
//  EmployeeCell.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// MARK: Info

/*
 Cell for each employee
*/
struct EmployeeCell: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        Label {
            Text(viewModel.employee.name)
        } icon: {
            Image(systemName: "person.fill")
                .foregroundColor(.orange)
        }
        .font(.subheadline)
        .fontWeight(.semibold)

    }
}

//#Preview {
//    EmployeeCell(viewModel: Employee(id: 1,
//                                name: "Stix Lee",
//                                salary: 150000,
//                                age: 62,
//                                image: "")
//    )
//}
