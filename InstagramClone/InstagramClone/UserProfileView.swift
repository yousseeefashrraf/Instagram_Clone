//
//  ContentView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 02/04/2025.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    var body: some View {
        ZStack{
            Color("BlackShade")
                .ignoresSafeArea()
            VStack{
                VStack(alignment: .leading){
                    HStack{
                        Text(userViewModel.user.username)
                            .font(.system(size: 24, weight: .bold))
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HeaderView(userViewModel: userViewModel)
                        .padding(.top, 25)
                }
                .padding(10)
                HighlightView(userViewModel: UserViewModel())
                PostAndNavigationView()
                    .padding(.top, 20)
                Spacer()
                
            }
        }
        
    }
}

#Preview {
    UserProfileView()
}
