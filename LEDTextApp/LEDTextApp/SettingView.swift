 
import SwiftUI

struct SettingView: View {
    @Binding var show:Bool
    @Binding var text:String
    @Binding var FontSelected :String
    @Binding var TcolorSelected:String
    @Binding var BcolorSelected :String
    @Binding var TsizsSelected:CGFloat 
    var fonts:[datamodel] = [
        datamodel(item: "Aa", font: "ChalkboardSE-Regular"),
                             datamodel(item: "Ab", font: "Palatino-Roman"),
                             datamodel(item: "Ac", font: "Futura-Medium"),
        datamodel(item: "Ad", font: "Copperplate"),
        datamodel(item: "Ae", font: "Optima-Regular"),
        datamodel(item: "Ae", font: "Papyrus")
    ]
    var Tcolor:[datamodel] = [
        datamodel(color: "tc"),
        datamodel(color: "tc1"),
        datamodel(color: "tc2"),
        datamodel(color: "tc3"),
        datamodel(color: "tc4"),
        datamodel(color: "tc5")
    ]
    var Bcolor:[datamodel] = [
        datamodel(color: "bc"),
        datamodel(color: "bc1"),
        datamodel(color: "bc2"),
        datamodel(color: "bc5"),
        datamodel(color: "bc3"),
        datamodel(color: "bc4")
        
    ]
    var Tsize:[datamodel] = [
        datamodel(item: "100",sizs: 100),
        datamodel(item: "150",sizs: 150),
        datamodel(item: "200",sizs: 200),
    ]
   
    var body: some View {
        VStack(alignment:.leading,spacing:18){
            SmallLED(text: $text, textsize: $TsizsSelected, Tcolor: $TcolorSelected, Bcolor: $BcolorSelected,   font: $FontSelected)
            textFview
            SelectionString(title: "Font", items: fonts, selected: $FontSelected, keyPathToProperty: \.font)
            SelectionString(title: "Text Color", items: Tcolor, selected: $TcolorSelected, keyPathToProperty: \.color)
            SelectionString(title: "BG Color", items: Bcolor, selected: $BcolorSelected, keyPathToProperty: \.color)
            SelectionCGFloat(title: "Text Size", items: Tsize, selected: $TsizsSelected, keyPathToProperty: \.sizs)
            Spacer()
        }
        .padding(.horizontal,20)
    }
    var textFview:some View {
        TextField("Your Massage", text: $text)
            .padding(.leading)
            .padding(.trailing,50)
            .frame(height: 60)
            .font(.custom(FontSelected, size: 18))
            .background(.black,in: .rect(cornerRadius: 10))
            .foregroundStyle(.white)
            .overlay(alignment: .trailing) {
                Button(action: {
                    withAnimation {
                        show.toggle()
                    }
                }, label: {
                    Text("PLAY").bold()
                        .frame(width: 60, height: 55)
                        .background(.white,in: .rect(cornerRadius: 10))
                        .foregroundStyle(.black)
                })
            }
           
             
    }
}

//#Preview {
//    SettingView()
//}
