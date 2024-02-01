//
//  IdentityView.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

struct IdentityView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 250, height: 250)
                .background(.clear)
                .foregroundStyle(Color.primaryForeground)
                .padding(.top, 96)
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text(viewModel.employee.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top, 12)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .frame(height: UIScreen.screenHeight * 0.5)
        .background(Color.gray)
        
    }
}

#Preview {
    IdentityView(viewModel: EmployeeViewModel(
        employee: Employee(id: 2,
                           name: "Stix Lee",
                           salary: 150000,
                           age: 62,
                           image: "")
        )
    )
}
