//
//  InputField.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    
    let title: String
    let isSecure: Bool
    let titleFont: Font = .headline
    let backgroundColor: Color = .clear
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(titleFont)
                    .foregroundStyle(Color.primaryForeground)
                    .padding(.bottom, 12)
                if isSecure {
                    SecureField("", text: $text)
                        .background(backgroundColor)
                        .foregroundStyle(Color.primaryForeground)
                        .padding(.bottom, 1)
                        .accentColor(Color.primaryForeground)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                } else {
                    TextField("", text: $text)
                        .background(backgroundColor)
                        .foregroundStyle(Color.primaryForeground)
                        .padding(.bottom, 1)
                        .accentColor(Color.primaryForeground)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                Rectangle()
                    .fill(Color.primaryForeground)
                    .frame(height: 2)
                Spacer()
            }
            Spacer()
        }
        .frame(height: 64)
    }
}

#Preview {
    InputField(text: .constant(""), title: "Password", isSecure: true)
}
