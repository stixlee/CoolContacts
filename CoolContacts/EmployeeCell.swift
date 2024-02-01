//
//  EmployeeCell.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

struct EmployeeCell: View {
    
    @ObservedObject var viewModel: Employee
    
    var body: some View {
        Label {
            Text(viewModel.name)
        } icon: {
            Image(systemName: "person.fill")
                .foregroundColor(.orange)
        }
        .font(.subheadline)
        .fontWeight(.semibold)

    }
}

#Preview {
    EmployeeCell(viewModel: Employee(id: 1,
                                name: "Stix Lee",
                                salary: 150000,
                                age: 62,
                                image: "")
    )
}
