
import SwiftUI


struct ProifleAndFollowersView: View{
    @ObservedObject var userViewModel: UserViewModel
    var body: some View{
        HStack(alignment: .top, spacing: 20){
            HStack(alignment: .bottom, spacing: -20){
                Image(userViewModel.user.profilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.grayShade)
                        
                    }
                
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.blackShade)
                    .frame(width: 25, height: 25)
                    .background(.white)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(.blackShade, lineWidth: 4)
                    }
            }
            
            //Names, followers etc
            VStack(alignment: .leading){
                HStack{
                    Text(userViewModel.user.name)
                        .bold()
                    Text(userViewModel.user.pronouns)
                        .foregroundStyle(.grayShade)
                }
                HStack(alignment: .top,spacing: 44){
                    //Posts
                    VStack(alignment: .leading, spacing: 0){
                        Text(" \(userViewModel.user.numberOfPosts)")
                            .bold()
                        
                        Text("posts")
                    }
                    
                    //Followers
                    VStack(alignment: .leading, spacing: 0){
                        Text(" \(userViewModel.user.followers)")
                            .bold()
                        
                        Text("followers")
                    }
                    
                    //Following
                    VStack(alignment: .leading, spacing: 0){
                        Text(" \(userViewModel.user.following)")
                            .bold()
                        
                        Text("following")
                    }
                }
                .font(.system(size: 17))
                .minimumScaleFactor(0.6)
                .padding(.top, 0.4)
                
            }
            .padding(.top, 0)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BioAndActionView: View{
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View{
        VStack{
            //Bio
            VStack(alignment: .leading){
                Text(userViewModel.user.caption)
                Text("See Translation")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 5)
            .bold()
            
            //Music section
            HStack(spacing: 2){
                if let song = userViewModel.user.pinedSong{
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading, 2)
                        .frame(width: 10, height: 10, alignment: .center)
                        .padding(5)
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                        }
                        .padding(.trailing, 5)
                    Text(song.name)
                        .bold()
                    Text(".")
                        .foregroundStyle(.grayShade)
                    Text(song.artist)
                        .foregroundStyle(.grayShade)
                }
                
            }
            .font(.system(size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //Actions
            
            HStack{
                Text("Edit profile")
                    .frame(width: 165, height: 35)
                
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 2)
                    }
                Text("Share profile")
                    .frame(width: 165, height: 35)
                
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.white, lineWidth: 2)
                    }
                
                //                Person and plus icon
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 2)
                        .frame(width: 35, height: 35)
                    HStack(alignment: .top, spacing: 0){
                        
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 7, height: 7)
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
            .bold()
        }
    }
}

struct HeaderView: View{
    @ObservedObject var userViewModel: UserViewModel
    var body: some View{
        VStack{
            ProifleAndFollowersView(userViewModel: userViewModel)
            
            BioAndActionView(userViewModel: userViewModel)
            
                }
        
    }
}

struct HighlightView: View{
    @ObservedObject var userViewModel: UserViewModel
    var body: some View{
        if let highlights = userViewModel.user.highlights{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 25){
                    ForEach(highlights) { highlight in
                        VStack(alignment: .center){
                            Image(highlight.coverPhoto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(.circle)
                                .frame(width: 70, height: 70)
                                .overlay {
                                    Circle()
                                        .stroke(lineWidth: 4)
                                        .foregroundStyle(.grayShade)
                                }
                                .padding(.top,10)
                            
                            Text(highlight.caption)
                        }
                    }
                    VStack(alignment: .center){
                        Image(systemName:"plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .clipShape(.circle)
                            .frame(width: 70, height: 70)
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 4)
                                    .foregroundStyle(.grayShade)
                            }
                        Text("New")
                    }
                    .padding(.top,10)
                }
                .frame(maxWidth: .infinity,alignment: .leading)

                .padding(.leading, 10)
            }
        }
    }
}
#Preview {
    HeaderView(userViewModel: UserViewModel())
}
