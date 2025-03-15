//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by mac on 3/12/25.
//


import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    @Namespace var animationNamespace // 创建一个动画的命名空间
    
    @State private var position = CGSize.zero // 用于控制视图的位置
    @State private var scale: CGFloat = 1.0
    @State private var isAdding = false
    
    var body: some View {
        
        VStack {
            
            VStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                    .matchedGeometryEffect(id: appetizer.id, in: animationNamespace) // 将图片和其他视图元素共享相同的命名空间
            }
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                // 开始添加到订单时的动画
                withAnimation(.easeInOut(duration: 0.5)) {
                    order.items.append(appetizer)
                    isAdding = true
                }
                
                // 动画后再关闭视图
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isShowingDetail = false
                    isAdding = false
                }
                
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .scaleEffect(isAdding ? 0.9 : 1.0) // 在点击时缩小按钮，给予动画反馈
                    .opacity(isAdding ? 0.5 : 1.0) // 点击后按钮透明度降低
                    .animation(.easeInOut(duration: 0.3), value: isAdding)
            }
            .padding()
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                // 触发关闭动画
                withAnimation(.easeInOut(duration: 0.5)) {
                    scale = 0.5
                    position = CGSize(width: 100, height: 100) // 设定目标位置
                }
                
                // 动画后再关闭视图
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isShowingDetail = false
                }
            } label: {
                ZStack {
                    SDismissButton()
                }
            }
            .padding() // 保证不紧贴边缘
            , alignment: .topTrailing
        )
        .scaleEffect(scale) // 控制视图的缩放效果
        .offset(position) // 控制视图的偏移
        .onAppear {
            // 初始时，视图处于正常大小和位置
            scale = 1.0
            position = CGSize.zero
        }
    }
}


struct NutritionInfo: View {
    let title: String
    let value: Int
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
