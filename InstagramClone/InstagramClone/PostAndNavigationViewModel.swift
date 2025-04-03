import SwiftUI


class NavigationViewModel: ObservableObject{
    @Published private(set) var selectd: Int = 0
    @Environment(\.colorScheme) var colorScheme
    func ChangeSelection(to value: Int){
        selectd = value
    }
    
    
    func returnIcon(imageSize: CGFloat, index: Int) -> some View{
        switch index{
        case 0:
            if index == selectd{
                return Image(systemName: "rectangle.grid.3x3.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .frame(width: 120, alignment: .center)
                
            } else {
                return Image(systemName: "rectangle.grid.3x3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .frame(width: 120, alignment: .center)
            }
            
        case 1:
            if index == selectd{
                return Image(systemName: "play.square.stack.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .frame(width: 120, alignment: .center)
            } else {
                return Image(systemName: "play.square.stack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .frame(width: 120, alignment: .center)
            }
            
        default:
            if index == selectd{
                return Image(systemName: "person.2.crop.square.stack.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)

                    .frame(width: 120, alignment: .center)
            } else {
                return  Image(systemName: "person.2.crop.square.stack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .frame(width: 120, alignment: .center)
            }
        }
        
        
        
        
        
    }
}

