//
//  SalaryCell.swift
//  CoolContacts
//
//  Created by Michael Lee on 2/1/24.
//

import SwiftUI

struct SalaryCell: View {
    
    let salary: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text("salary:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.primaryForeground)
                .padding([.top, .bottom], 14)
                .padding(.leading, 8)
                .background(.clear)
            Text(salary,
                 format: .currency(code: "USD").precision(.fractionLength(0)))
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
    SalaryCell(salary: 150000)
}
