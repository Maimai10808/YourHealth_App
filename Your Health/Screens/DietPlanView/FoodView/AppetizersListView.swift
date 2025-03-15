//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by mac on 3/11/25.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
   
    
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(viewModel.appetizers) {
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedApptizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                    
                }
                    .navigationTitle("Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(
                    appetizer: viewModel.selectedApptizer!,
                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
        
    
    
        
}

#Preview {
    AppetizersListView()
}
