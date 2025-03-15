//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by mac on 3/11/25.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            
            VStack() {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
            }
            .padding()
            
            
        }
        
        
        
    }
}

#Preview {
    AppetizerListCell(appetizer:
                        MockData.sampleAppetizer)
}
