//
//  AgeCell.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

struct AgeCell: View {
    
    let age: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text("age:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primaryForeground)
                .padding([.top, .bottom], 14)
                .padding(.leading, 8)
                .background(.clear)
            Text("\(age)")
                .font(.subheadline)
                .foregroundStyle(.primaryForeground)
                .padding([.top, .bottom], 14)
                .background(.clear)
            Spacer()
        }
        .background(Color.fieldBackground)
        .cornerRadius(10)
    }
}

#Preview {
    AgeCell(age: 62)
}
