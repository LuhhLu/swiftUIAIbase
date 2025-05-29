
import SwiftUI

struct tabBar: View {
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Rectangle()
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white.opacity(0.5))
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .foregroundColor(.black)
            }
            HStack(spacing: 28){
                baricons(iconname: "house.fill", titel: "home")
                baricons(iconname: "person.2", titel: "friends")
                    .offset(y: 2)
                    addbutton()
                baricons(iconname: "minus.square", titel: "index")
                baricons(iconname: "person", titel: "person")
                
            }
            
            
        }
    }
    @ViewBuilder
    func  addbutton() -> some View {
        ZStack{
            Rectangle()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color1"),Color("Color")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 60, height: 40)
                .cornerRadius(10)
            Rectangle()
                .frame(width: 50, height: 40)
                .foregroundColor(.white)
                .cornerRadius(10)
            Image(systemName: "plus")
                .imageScale(.large)
                .foregroundColor(.black)
        }
        
        
    }
}

struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        tabBar()
    }
}
struct baricons: View {
    var iconname = ""
    var titel = ""
    var body: some View {
        VStack{
            Image(systemName: iconname)
                .font(.title2)
            Text(titel)
                .font(.system(size: 15))
        }
        .foregroundColor(.gray)
    }
}
