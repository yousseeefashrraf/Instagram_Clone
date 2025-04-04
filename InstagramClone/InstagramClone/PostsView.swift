//
//  PostsView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 03/04/2025.
//

import SwiftUI

struct PostsView: View {
    let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
    ]
    @ObservedObject var userViewModel: UserViewModel
    var body: some View {
        if let posts = userViewModel.user.posts{
                VStack{
               
                    LazyVGrid(columns: gridItems, spacing: 2){
                        ForEach(0 ..< 4){ index in
                            NavigationLink( value: index){
                                ZStack(alignment: .topTrailing){
                                    
                                    Image(posts[index].pictures[0])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: .infinity)
                                    
                                    Image(systemName:"square.filled.on.square")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 17)
                                        .rotationEffect(.degrees(180))
                                        .padding(5)
                                }
                            }
                        }
                        .foregroundStyle(.white)
                    }
                    
                    
                }

            
        }
    }
}

#Preview {
    PostsView(userViewModel: UserViewModel())
}
