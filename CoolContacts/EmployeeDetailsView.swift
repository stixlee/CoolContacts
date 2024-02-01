//
//  EmployeeDetailsView.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

struct EmployeeDetailsView: View {
    
    @ObservedObject var viewModel: EmployeeViewModel
    
    var body: some View {
        Text("Employee Details for \(viewModel.employee.name)")
    }
}

//#Preview {
//    EmployeeDetailsView()
//}
