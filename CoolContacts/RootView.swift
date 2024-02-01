//
//  RootView.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                do {
                    let employees = try await api.fetchEmployees()
                    print("SUCCESS")
                } catch (let error) {
                    if let networkingError = error as? NetworkingError {
                        print("Networking Error: \(networkingError)")
                    }
                }
            }
    }
    
}

#Preview {
    RootView()
}
