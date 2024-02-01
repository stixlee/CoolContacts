//
//  AddEmployeeView.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// MARK: Info

/*
Presented View for adding a new employee
 */
struct AddEmployeeView: View {
    
    @ObservedObject var viewModel: AllEmployeesViewModel
    @Binding var isPresented: Bool
    
    @State var name: String = ""
    @State var age: String = ""
    @State var salary: String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Text("Add Employee")
                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryForeground)
                    }
                }
                .padding(.trailing, 18)
            }
            .padding(.top, 36)
            .padding(.bottom, 64)
            InputField(text: $name, title: "name", isSecure: false)
            InputField(text: $age, title: "age", isSecure: false)
            InputField(text: $salary, title: "salary", isSecure: false)
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8) {
                Button(action: {
                    let newEmployee = Employee(id: viewModel.nextId,
                                               name: name,
                                               salary: Int(salary) ?? 0,
                                               age: Int(age) ?? 0,
                                               image: "")
                    viewModel.addEmployee(employee: newEmployee)
                    isPresented.toggle()
                }, label: {
                    Text("Add")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .opacity(0.75)
                        .frame(width: 232)
                        .padding([.top, .bottom], 4)
                })
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                Spacer()
            }
            Spacer()
        }
        .padding([.leading, .trailing], 18)
    }
}
