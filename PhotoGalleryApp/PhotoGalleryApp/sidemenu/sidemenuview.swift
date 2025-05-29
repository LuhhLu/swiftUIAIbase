
import SwiftUI

struct sidemenuview: View {
    @State var selecteditem:TabIcon = .Home
    @State var yOffset:CGFloat = 0
    var body: some View {
        ZStack{
            Color(.black)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: 266)
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    userimage()
                    tabview(selecteditem: $selecteditem, yOffset: $yOffset)
                }
                .padding(.leading,15)
             
                divider()
                tabviewV()
                HStack{
                    Text("Learn more about the app ")
                        .padding(.leading)
                    Image(systemName: "questionmark.circle")
                }
                .foregroundColor(.white)
                .padding(.top,5)
                Spacer()
                HStack{
                    Bicon(icon: "moon.zzz.fill")
                    Spacer()
                    Text("Shoping")
                   .font(.custom("Bradley Hand", size: 22))
                        .foregroundColor(.white)
                    Spacer()
                    Bicon(icon: "gearshape.fill")
                }
                .padding(.bottom,20)
                .frame(width: 230,height: 90)
                .padding(.leading,17)
               
                 
            }
           
        }
        .ignoresSafeArea()
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct sidemenuview_Previews: PreviewProvider {
    static var previews: some View {
        sidemenuview()
    }
}

struct userimage: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 65, height: 65)
            
            VStack(alignment: .leading,spacing: 4){
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 14)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 80, height: 7)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 52, height: 7)
                    .opacity(0.5)
                
            }
            
        }
        .foregroundColor(.white)
        .padding(.top,60)
    }
}
struct tabview: View {
    @Binding var selecteditem:TabIcon
    @Binding var yOffset:CGFloat
    @State var isAnimation = false
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width:isAnimation ? 7 : 230 , height:45 )
                .foregroundColor(.purple)
                .cornerRadius(7)
                .offset(y: yOffset)
                .padding(.vertical,8)
                .padding(.horizontal,5)
                .offset(y: -125)
                .offset(x: -20)
                .animation(.default, value: isAnimation)
            VStack (spacing: 0){
                ForEach(sidebar) { item in
                    Button {
                        withAnimation {
                            isAnimation = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            withAnimation {
                                selecteditem = item.tab
                                yOffset = CGFloat(item.index) * 70
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                            withAnimation {
                                isAnimation = false
                            }
                        }
                        
                    } label: {
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 39, height: 40)
                                    .foregroundStyle(.ultraThinMaterial)
                                Image(systemName: item.icon)
                                    .foregroundColor(.white)
                            }
                            Text(item.title).bold()
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            Spacer()
                        }
                        .padding(.top,30)
                    }
                }
               
             
            }
            .frame(width: 246, height: 330)
  
        }
    }
}
struct divider: View {
    var body: some View {
        Rectangle().frame(width: 266, height: 1)
            .foregroundColor(.gray.opacity(0.4))
            .padding(.top,30)
    }
}
struct Bicon: View {
    var icon = ""
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(.ultraThinMaterial)
            Image(systemName: icon)
                .foregroundColor(.white)
        }
    }
}
