//
//  EmployeeViewModel.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

// Mark: View State
@Observable final class EmployeeViewModel: ObservableObject {
    
    var employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    var injectedImagePath: String? {
        let uppercaseName = employee.name.uppercased()
        if uppercaseName.hasPrefix("ST") {
            return "https://s3.us-west-2.amazonaws.com/com.soshlapp.assets/images/MikeLee-300X334.png"
        }
        if uppercaseName.hasPrefix("BRI") {
            return "https://s3.us-west-2.amazonaws.com/com.soshlapp.assets/images/meridithLee.jpg"
        }
        if uppercaseName.hasPrefix("BRA") {
            return "https://s3.us-west-2.amazonaws.com/com.soshlapp.assets/images/MikeLee-300X334.png"
        }
        if uppercaseName.hasPrefix("AS") {
            return "https://s3.us-west-2.amazonaws.com/com.soshlapp.assets/images/Aiden.jpg"
        }
        if uppercaseName.hasPrefix("CO") {
            return "https://s3.us-west-2.amazonaws.com/com.soshlapp.assets/images/mishaLee.jpg"
        }

        return nil
    }
}

