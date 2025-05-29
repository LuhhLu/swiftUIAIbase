 

import SwiftUI

struct NoteOverview: View {
    var vm:Model
    var body: some View {
        if vm.notes.isEmpty{
            VStack{
                StickerNote(image: .frame1, title: "1. \nClik on + button", degrees: 3)
                StickerNote(image: .frame2, title: "2. \nType your task", degrees: -4)
                StickerNote(image: .frame3, title: "3.\nChoose  the sticker note", degrees: -2)
            }
        }else{
            
            VStack {
                ForEach(vm.notes.prefix(3)){ item in
                    ZStack {
                        Image(item.card).resizable().scaledToFill()
                            .frame(width: 145, height: 120)
                        Text(item.note)
                            .font(.custom("JustAnotherHand-Regular", size: 20))
                            .frame(width: 100, height: 80)
                            .foregroundColor(.black)
                    }
                }
               
            }
            .frame(height: 350,alignment: .top)
           
        }
      
    }
}

#Preview {
    NoteOverview(vm: Model())
}

struct StickerNote: View {
    var image:ImageResource
    var title:String
    var degrees:Double
    var body: some View {
        ZStack{
            Image(image).resizable().scaledToFill()
            .frame(width: 145, height: 120)
            Text(title)
                .font(.custom("PatrickHand-Regular", size: 15))
                .frame(width: 100)
               
        }
        .rotationEffect(.degrees(degrees))
        .offset(y: -10)
    }
}

 
