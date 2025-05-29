

import SwiftUI

struct FoodCard: View {
    var width:CGFloat = 200
    @State var cards:CGFloat = 20
    @State var protein:CGFloat = 100
    @State var fat:CGFloat = 70
    @State var name :String = ""
    @State var titel :String = ""
    @State var icon :String = ""
    
    var body: some View {
        let multipier = width / 40
      return  VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(name)
                    .font(.title2)
                    .frame(width: 160)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
            }
            .bold()
            HStack{
                Text(titel)
                Spacer()
                
            }
            .frame(width: 200, height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20, y: -20)
        .frame(width: 270, height: 110)
        .background(.white)
        .cornerRadius(10)
        .modifier(customShadow())
        .overlay(alignment: .topLeading, content: {
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .offset(x: -12, y: -16)
        })
        .overlay(alignment: .bottom, content: {
            HStack{
                Elements(name: "cards", foodElemint: cards, multipier: multipier, color: "cards")
                Elements(name: "fat", foodElemint: fat, multipier: multipier, color: "fat")
                 Elements(name: "protein", foodElemint: protein, multipier: multipier, color: "protein")
                
            }
          
        })
        
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard()
    }
}
struct Elements: View {
    var name = "name"
    var foodElemint:CGFloat = 0
    var multipier:CGFloat = 0
    var color = ""
    var body: some View {
        let width : CGFloat = 130
        let multipier = width / 200
     return VStack{
            Text(name)
                .font(.system(size: 12))
            Rectangle().frame(width: foodElemint * multipier, height: 5)
                .cornerRadius(5)
                .foregroundColor(Color(color))
        }
        .padding(.bottom,5)
        .frame(width: 90)
    }
}
