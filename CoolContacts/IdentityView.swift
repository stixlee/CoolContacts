//
//  IdentityView.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

// MARK: Info

/*
Top section of EmployeeDetailView
 */
struct IdentityView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            
            if let path = viewModel.injectedImagePath {
                AsyncImage(url: URL(string: path)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
                .cornerRadius(150)
                .padding(.top, 128)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .background(.clear)
                    .foregroundStyle(.black)
                    .padding(.top, 128)
            }
            
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Text(viewModel.employee.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Spacer()
            }
            .padding(.top, 24)
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .frame(height: UIScreen.screenHeight * 0.6)
        .background(Color.detailsBackground)
        
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
