//
//  ContentView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 02/04/2025.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    @StateObject var navigationViewModel = NavigationViewModel()
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                Color("BlackShade")
                    .ignoresSafeArea()
                
                ScrollView{
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
                        PostAndNavigationView(navigationViewModel: navigationViewModel)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        if navigationViewModel.selectd == 0{
                            PostsView(userViewModel: userViewModel)
                        }
                        
                        Spacer()
                    }
                }
                .scrollIndicators(.hidden)
                .clipped()
            }
            .navigationDestination(for: Int.self) { index in
                if let posts = userViewModel.user.posts {
                    PostView(user: userViewModel.user, post: posts[index])
                }
                
            }
        }
        .tint(.white)
        
    }
}

#Preview {
    UserProfileView()
}
