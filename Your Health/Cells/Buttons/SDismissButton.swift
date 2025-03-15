//
//  SDismissButton.swift
//  Appetizers
//
//  Created by mac on 3/12/25.
//

import SwiftUI

struct SDismissButton: View {
    var body: some View {
        // 圆圈
        Circle()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .opacity(0.6)
        
        // "X" 图标
        Image(systemName: "xmark")
            .imageScale(.small)
            .frame(width: 44, height: 44)
            .foregroundColor(.black)
    }
}

#Preview {
    SDismissButton()
}
