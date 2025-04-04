//
//  PostView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 03/04/2025.
//

import SwiftUI

struct PostView: View {
    @StateObject var user: User
    @StateObject var post: Post
    var body: some View {
        ScrollView{
            VStack(spacing: -5){
                VStack(spacing: -10){
                    //Title
                    HStack(spacing: 200){
                        HStack{
                            Image(user.profilePicture)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(.circle)
                            
                            Text(user.username)
                                .font(.system(size: 14, weight: .semibold))
                        }
                        Image(systemName: "ellipsis")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 4, height: 4)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,10)
                    TabView{
                        
                        ForEach(0 ..< post.pictures.count, id: \.self){ index in
                                
                                    Image(post.pictures[index])
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.bottom, 20)
                                    
                                        
                            
                            
                            
                        }
                    }
                    
                    .tabViewStyle(.page)
                    .frame(height: 600)
                    .clipped()
                    
                }
                
                // Action bar
                HStack{
                    HStack (spacing: 20){
                        // love
                        Button{
                            post.isLiked.toggle()
                            if post.isLiked == false{
                                post.likes -= 1
                            } else {
                                post.likes += 1
                            }
                           
                        }label: {
                            HStack{
                                if !post.isLiked{
                                    Image(systemName:"heart")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25,height: 25)
                                } else {
                                    Image(systemName:"heart.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.red)
                                        .frame(width: 25,height: 25)
                                }
                                Text("\(post.likes)")
                            }
                            .foregroundStyle(.white)
                        }
                        
                        
                        
                        HStack{
                            Image(systemName:"message")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(x: -1, y: 1)
                                .frame(width: 25,height: 25)
                            
                            Text("\(post.comments)")
                        }
                        
                        HStack{
                            Image(systemName:"paperplane")
                                .resizable()
                                .scaledToFit()
                                .rotationEffect(.degrees(10))
                                .frame(width: 25,height: 25)
                            
                            Text("\(post.shares)")
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    Image(systemName:"bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25,height: 25)
                }
                HStack{
                    HStack(spacing: -5){
                        Image("hany")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(.blackShade, lineWidth: 2)
                            }
                            .zIndex(5)
                        
                        Image("nabil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(.blackShade, lineWidth: 2)
                            }
                            .zIndex(4)
                        Image("salama")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(.blackShade, lineWidth: 2)
                            }
                            .zIndex(3)
                    }
                    
                    Text("Liked by ")
                    +
                    Text("muramzyy_ ")
                        .bold()
                    +
                    Text("and ")
                    +
                    Text("others")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                .padding(.top, 10)
                HStack(spacing: 5){
                    Text(user.username + "  ")
                        .bold()
                    +
                    Text(post.catption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                .padding(.horizontal, 10)
                
                Spacer()
            }
            .navigationTitle(Text("\(user.username.uppercased())\n").bold() + Text("Posts"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PostView(user: UserViewModel().user, post: (UserViewModel().user.posts?[1])!)
}
