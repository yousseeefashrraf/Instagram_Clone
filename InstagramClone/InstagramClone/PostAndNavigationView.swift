//
//  PostAndNavigationView.swift
//  InstagramClone
//
//  Created by Youssef Ashraf on 03/04/2025.
//

import SwiftUI

struct NavigationView: View{
    @StateObject var navigationViewModel = NavigationViewModel()
    @Environment(\.colorScheme) var colorScheme
    let imageSize: CGFloat = 30
    var body: some View{
        HStack(alignment: .center, spacing: 15){
            Button{
                navigationViewModel.ChangeSelection(to: 0)
                
            } label:{
                
                if navigationViewModel.selectd == 0 {
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 0)
                        .foregroundStyle(colorScheme == .dark ? .white : .gray)
                        .rotationEffect(.degrees(90))
                        .frame(width: 120, alignment: .center)
                        .overlay{
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(colorScheme == .dark ? .white : .gray)
                                .frame(width: 60,height: 60, alignment: .bottom)
                            
                        }
                } else {
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 0)
                        .rotationEffect(.degrees(90))

                    
                }
            }
            
            Button{
                navigationViewModel.ChangeSelection(to: 1)
            } label:{
                
                if navigationViewModel.selectd == 1 {
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 1)
                        .overlay{
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(colorScheme == .dark ? .white : .gray)
                                .frame(width: 60,height: 60, alignment: .bottom)
                            
                        }
                } else {
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 1)
                    
                }
                
                
                
            }
            
            Button{
                navigationViewModel.ChangeSelection(to: 2)
            } label:{
                
                if navigationViewModel.selectd == 2 {
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 2)
                        .overlay{
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(colorScheme == .dark ? .white : .gray)
                                .frame(width: 60,height: 60, alignment: .bottom)
                            
                        }
                } else {
                    
                    
                    navigationViewModel.returnIcon(imageSize: imageSize, index: 2)
                    
                }
                
                
                
            }
        }
            .foregroundStyle(colorScheme == .dark ? .white : .gray)
        }
    }
    struct PostAndNavigationView: View {
        var body: some View {
            VStack{
                NavigationView()
            }
        }
    }
    
    #Preview {
        PostAndNavigationView()
    }
