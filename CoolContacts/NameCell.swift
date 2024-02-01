//
//  NameCell.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

// MARK: Info

/*
 Individual cell for name
 */
struct NameCell: View {
    
    let name: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text("name:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primaryForeground)
                .padding([.top, .bottom], 14)
                .padding(.leading, 8)
                .background(.clear)
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
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
    NameCell(name: "Stix Lee")
}
