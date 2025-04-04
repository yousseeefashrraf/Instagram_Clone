import Foundation


struct Song: Hashable{
    var name: String
    var artist: String
}

class Post: Identifiable, ObservableObject{
    
    var id = UUID()
    var pictures: [String]
    var catption: String
    var likes: Int
    var comments: Int
    var shares: Int
    @Published var isLiked = false
    
    init(pictures: [String], catption: String, likes: Int, comments: Int, shares: Int, isLiked: Bool = false) {
        self.pictures = pictures
        self.catption = catption
        self.likes = likes
        self.comments = comments
        self.shares = shares
        self.isLiked = isLiked
        print(isLiked)
    }
}
struct Highlight: Hashable, Identifiable{
    var id = UUID()
    var caption: String
    var coverPhoto: String
}
class User: ObservableObject{
    var name: String
    var username: String
    var pronouns: String
    var numberOfPosts: Int
    var followers: Int
    var following: Int
    var caption: String
    var pinedSong: Song?
    var profilePicture: String
    @Published var posts: [Post]?
    var highlights: [Highlight]?
    
    init(name: String, username: String, pronouns: String, numberOfPosts: Int, followers: Int, following: Int, caption: String, pinedSong: Song? = nil, profilePicture: String, posts: [Post]? = nil, highlights: [Highlight]? = nil) {
        self.name = name
        self.username = username
        self.pronouns = pronouns
        self.numberOfPosts = numberOfPosts
        self.followers = followers
        self.following = following
        self.caption = caption
        self.pinedSong = pinedSong
        self.profilePicture = profilePicture
        self.posts = posts
        self.highlights = highlights
    }
}


// mockdata

class UserViewModel: ObservableObject{
    @Published var user: User
    
    init(){
        var song: Song = Song(name: "BA2EENA GHORAB", artist: "TUL8TE")
        var highlights: [Highlight] = [Highlight(caption: "France 🇫🇷", coverPhoto: "h1"),
                                       Highlight(caption: "Austria 🇦🇹", coverPhoto: "h2"),
                                       Highlight(caption: "Random", coverPhoto: "h3"),
                                       Highlight(caption: "Me 🥶", coverPhoto: "h4")
            
            
        ]
        var numberOfPicturesInEachCountry = ["france": 11,
                                             "hungary": 7,
                                             "lativa": 4]
        
        var captionOfPicturesInEachCountry = ["france": "France pt. 1 🇫🇷!",
                                              "france2":"France pt. 2 🇫🇷!",
                                             "hungary": "Budapest, Where every corner is a photo op! 📸🇭🇺",
                                             "latvia": "Let it be 🇱🇻."]
        
        var likesOfPicturesInEachCountry = ["france": 98,
                                              "france2":55,
                                             "hungary": 79,
                                             "latvia": 150]
        
        var commentsOfPicturesInEachCountry = ["france": 5,
                                              "france2":6,
                                             "hungary": 3,
                                             "latvia": 11]
        var sharesOfPicturesInEachCountry = ["france": 3,
                                              "france2":5,
                                             "hungary": 1,
                                             "latvia": 0]
        
        var posts: [Post] = []
        var postPics: [String]
        for (country, number) in numberOfPicturesInEachCountry{
            postPics = []
            
            for numberOfPics in 1...number{
                if country == "france" && numberOfPics > 6{
                    break
                }
                postPics.append(country + "\(numberOfPics)")
            }
        
            posts.append(Post(pictures: postPics, catption: captionOfPicturesInEachCountry[country] ?? "", likes: likesOfPicturesInEachCountry[country] ?? 0, comments: commentsOfPicturesInEachCountry[country] ?? 15, shares: sharesOfPicturesInEachCountry[country] ?? 0, isLiked: false))
                         
                if country == "france" {
                    postPics = []
                for numberOfPics in 7...number{
                    postPics.append(country + "\(numberOfPics)")
                }
                    
                    posts.append(Post(pictures: postPics, catption: captionOfPicturesInEachCountry[country+"2"] ?? "", likes: likesOfPicturesInEachCountry[country+"2"] ?? 0, comments: commentsOfPicturesInEachCountry[country+"2"] ?? 0, shares: sharesOfPicturesInEachCountry[country+"2"] ?? 0, isLiked: false))
                
            }
                         
                         
            
        }
        
        posts = posts.sorted{
            return $0.comments < $1.comments
        }
        user = User(name: "Youssef Ashraf", username: "yousseefashrraf", pronouns: "he/him", numberOfPosts: 4, followers: 334, following: 431, caption: "وَلَا يَظْلِمُ رَبُّكَ أَحَدًا ❤️", pinedSong: song,profilePicture: "me", posts: posts,highlights: highlights)
    }
    
    func togglePost(post: Post){
        post.isLiked.toggle()
    }
}
