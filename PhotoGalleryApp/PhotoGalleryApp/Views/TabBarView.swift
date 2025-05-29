 
import SwiftUI

struct TabBarView: View {
    @State var progress:CGFloat = 0.5
    @State  var selecteditem:TabIcon1 = .Home
    @State var xOffset:CGFloat = 2 * 70.0
    var body: some View {
        HStack{
            ForEach(sidebar1) { item in
                Spacer()
                Image(systemName:item.icon)
                    .foregroundColor(.black)
                    .onTapGesture {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                selecteditem = item.tab
                                xOffset = CGFloat(item.index) * 70.0
                                
                            }
                        }
                        withAnimation {
                            progress = 0.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                            withAnimation {
                                progress = 0.5
                            }
                        }
                    }
                Spacer()
            }
            .frame(width: 23.3, height: 23)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .frame(height: 73)
        .background(.ultraThickMaterial)
        .cornerRadius(20)
        .overlay(alignment: .topLeading) {
            CircleAnimation(circleA: $progress)
                .offset(x: 16.3,y: 17)
                .offset(x: xOffset)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
