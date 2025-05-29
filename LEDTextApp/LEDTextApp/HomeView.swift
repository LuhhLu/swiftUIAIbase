 
import SwiftUI

struct HomeView: View {
    @State var show = false
    @State var text = ""
    @State var FontSelected = "ChalkboardSE-Regular"
    @State var TcolorSelected = "tc"
    @State var BcolorSelected = "bc"
    @State var TsizsSelected:CGFloat = 100
    @State var flash = false
    @State var speed:CGFloat = 0
    var body: some View {
        ZStack{
            Color.SBG.ignoresSafeArea()
            if !show{
                ScrollView {
                    SettingView(show:$show,text: $text, FontSelected: $FontSelected, TcolorSelected: $TcolorSelected, BcolorSelected: $BcolorSelected, TsizsSelected: $TsizsSelected)
                }
                .ignoresSafeArea()
                
            }else{
                LEDTextAnimation(text: $text, textsize: $TsizsSelected,Tcolor: $TcolorSelected,Bcolor: $BcolorSelected, font: $FontSelected)
                    .overlay(alignment: .topTrailing) {
                        Button(action: {
                            withAnimation {
                                show.toggle()
                            }
                        }, label: {
                            Image(systemName: "chevron.backward").bold()
                                .frame(width: 50, height: 50)
                                .background(.white,in:RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                                .foregroundStyle(.white)
                        })
                        .rotationEffect(.degrees(90))
                        .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
