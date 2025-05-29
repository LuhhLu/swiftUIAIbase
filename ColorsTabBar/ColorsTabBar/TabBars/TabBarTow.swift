
import SwiftUI
struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.9475*width, y: 1.12361*height))
        path.addLine(to: CGPoint(x: -0.045*width, y: 1.12361*height))
        path.addCurve(to: CGPoint(x: -0.02539*width, y: 1.09537*height), control1: CGPoint(x: -0.04118*width, y: 1.11837*height), control2: CGPoint(x: -0.03439*width, y: 1.10885*height))
        path.addCurve(to: CGPoint(x: 0.03298*width, y: 0.99973*height), control1: CGPoint(x: -0.01216*width, y: 1.07556*height), control2: CGPoint(x: 0.0087*width, y: 1.04289*height))
        path.addCurve(to: CGPoint(x: 0.11007*width, y: 0.84638*height), control1: CGPoint(x: 0.06026*width, y: 0.95123*height), control2: CGPoint(x: 0.08619*width, y: 0.89963*height))
        path.addCurve(to: CGPoint(x: 0.18941*width, y: 0.6402*height), control1: CGPoint(x: 0.13992*width, y: 0.77981*height), control2: CGPoint(x: 0.16661*width, y: 0.71044*height))
        path.addCurve(to: CGPoint(x: 0.24893*width, y: 0.46172*height), control1: CGPoint(x: 0.20638*width, y: 0.58789*height), control2: CGPoint(x: 0.22751*width, y: 0.52279*height))
        path.addCurve(to: CGPoint(x: 0.31297*width, y: 0.29672*height), control1: CGPoint(x: 0.27234*width, y: 0.39496*height), control2: CGPoint(x: 0.29329*width, y: 0.34099*height))
        path.addCurve(to: CGPoint(x: 0.34628*width, y: 0.22877*height), control1: CGPoint(x: 0.32435*width, y: 0.27114*height), control2: CGPoint(x: 0.33555*width, y: 0.24828*height))
        path.addCurve(to: CGPoint(x: 0.38022*width, y: 0.17557*height), control1: CGPoint(x: 0.35782*width, y: 0.20777*height), control2: CGPoint(x: 0.36924*width, y: 0.18987*height))
        path.addCurve(to: CGPoint(x: 0.41463*width, y: 0.1409*height), control1: CGPoint(x: 0.3919*width, y: 0.16036*height), control2: CGPoint(x: 0.40348*width, y: 0.14869*height))
        path.addCurve(to: CGPoint(x: 0.44936*width, y: 0.12851*height), control1: CGPoint(x: 0.42641*width, y: 0.13268*height), control2: CGPoint(x: 0.43809*width, y: 0.12851*height))
        path.addCurve(to: CGPoint(x: 0.48408*width, y: 0.14082*height), control1: CGPoint(x: 0.46057*width, y: 0.12851*height), control2: CGPoint(x: 0.47225*width, y: 0.13266*height))
        path.addCurve(to: CGPoint(x: 0.51877*width, y: 0.17528*height), control1: CGPoint(x: 0.49529*width, y: 0.14856*height), control2: CGPoint(x: 0.50696*width, y: 0.16016*height))
        path.addCurve(to: CGPoint(x: 0.55317*width, y: 0.22816*height), control1: CGPoint(x: 0.52988*width, y: 0.18951*height), control2: CGPoint(x: 0.54145*width, y: 0.2073*height))
        path.addCurve(to: CGPoint(x: 0.58705*width, y: 0.29575*height), control1: CGPoint(x: 0.56409*width, y: 0.2476*height), control2: CGPoint(x: 0.57549*width, y: 0.27034*height))
        path.addCurve(to: CGPoint(x: 0.65224*width, y: 0.46*height), control1: CGPoint(x: 0.60732*width, y: 0.34028*height), control2: CGPoint(x: 0.62865*width, y: 0.39401*height))
        path.addCurve(to: CGPoint(x: 0.71236*width, y: 0.63801*height), control1: CGPoint(x: 0.67349*width, y: 0.51943*height), control2: CGPoint(x: 0.69369*width, y: 0.58068*height))
        path.addCurve(to: CGPoint(x: 0.7919*width, y: 0.8444*height), control1: CGPoint(x: 0.7352*width, y: 0.70817*height), control2: CGPoint(x: 0.76196*width, y: 0.77761*height))
        path.addCurve(to: CGPoint(x: 0.86922*width, y: 0.99852*height), control1: CGPoint(x: 0.81584*width, y: 0.89782*height), control2: CGPoint(x: 0.84186*width, y: 0.94967*height))
        path.addCurve(to: CGPoint(x: 0.92777*width, y: 1.09498*height), control1: CGPoint(x: 0.89357*width, y: 1.04197*height), control2: CGPoint(x: 0.9145*width, y: 1.07496*height))
        path.addCurve(to: CGPoint(x: 0.9475*width, y: 1.12361*height), control1: CGPoint(x: 0.93685*width, y: 1.10866*height), control2: CGPoint(x: 0.94368*width, y: 1.11832*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.44936*width, y: 0.13097*height))
        path.addCurve(to: CGPoint(x: 0.41477*width, y: 0.14331*height), control1: CGPoint(x: 0.43814*width, y: 0.13097*height), control2: CGPoint(x: 0.4265*width, y: 0.13512*height))
        path.addCurve(to: CGPoint(x: 0.38046*width, y: 0.17787*height), control1: CGPoint(x: 0.40365*width, y: 0.15107*height), control2: CGPoint(x: 0.39211*width, y: 0.1627*height))
        path.addCurve(to: CGPoint(x: 0.3466*width, y: 0.23095*height), control1: CGPoint(x: 0.36951*width, y: 0.19214*height), control2: CGPoint(x: 0.35812*width, y: 0.20999*height))
        path.addCurve(to: CGPoint(x: 0.31335*width, y: 0.29878*height), control1: CGPoint(x: 0.33589*width, y: 0.25042*height), control2: CGPoint(x: 0.3247*width, y: 0.27324*height))
        path.addCurve(to: CGPoint(x: 0.24937*width, y: 0.46362*height), control1: CGPoint(x: 0.29368*width, y: 0.343*height), control2: CGPoint(x: 0.27276*width, y: 0.39692*height))
        path.addCurve(to: CGPoint(x: 0.18987*width, y: 0.64205*height), control1: CGPoint(x: 0.22796*width, y: 0.52466*height), control2: CGPoint(x: 0.20684*width, y: 0.58975*height))
        path.addCurve(to: CGPoint(x: 0.11044*width, y: 0.84845*height), control1: CGPoint(x: 0.16705*width, y: 0.71236*height), control2: CGPoint(x: 0.14032*width, y: 0.78181*height))
        path.addCurve(to: CGPoint(x: 0.03329*width, y: 1.00192*height), control1: CGPoint(x: 0.08655*width, y: 0.90174*height), control2: CGPoint(x: 0.06059*width, y: 0.95338*height))
        path.addCurve(to: CGPoint(x: -0.02511*width, y: 1.09762*height), control1: CGPoint(x: 0.009*width, y: 1.0451*height), control2: CGPoint(x: -0.01188*width, y: 1.0778*height))
        path.addCurve(to: CGPoint(x: -0.04133*width, y: 1.12116*height), control1: CGPoint(x: -0.03187*width, y: 1.10774*height), control2: CGPoint(x: -0.03738*width, y: 1.11563*height))
        path.addLine(to: CGPoint(x: 0.94386*width, y: 1.12116*height))
        path.addCurve(to: CGPoint(x: 0.9275*width, y: 1.09723*height), control1: CGPoint(x: 0.93989*width, y: 1.11556*height), control2: CGPoint(x: 0.93433*width, y: 1.10754*height))
        path.addCurve(to: CGPoint(x: 0.86891*width, y: 1.0007*height), control1: CGPoint(x: 0.91422*width, y: 1.0772*height), control2: CGPoint(x: 0.89327*width, y: 1.04419*height))
        path.addCurve(to: CGPoint(x: 0.79152*width, y: 0.84647*height), control1: CGPoint(x: 0.84152*width, y: 0.95182*height), control2: CGPoint(x: 0.81549*width, y: 0.89993*height))
        path.addCurve(to: CGPoint(x: 0.7119*width, y: 0.63986*height), control1: CGPoint(x: 0.76156*width, y: 0.77962*height), control2: CGPoint(x: 0.73477*width, y: 0.7101*height))
        path.addCurve(to: CGPoint(x: 0.65181*width, y: 0.46192*height), control1: CGPoint(x: 0.69324*width, y: 0.58254*height), control2: CGPoint(x: 0.67304*width, y: 0.52132*height))
        path.addCurve(to: CGPoint(x: 0.58668*width, y: 0.29782*height), control1: CGPoint(x: 0.62823*width, y: 0.39599*height), control2: CGPoint(x: 0.60693*width, y: 0.34231*height))
        path.addCurve(to: CGPoint(x: 0.55286*width, y: 0.23035*height), control1: CGPoint(x: 0.57514*width, y: 0.27245*height), control2: CGPoint(x: 0.56376*width, y: 0.24975*height))
        path.addCurve(to: CGPoint(x: 0.51853*width, y: 0.17758*height), control1: CGPoint(x: 0.54116*width, y: 0.20953*height), control2: CGPoint(x: 0.52961*width, y: 0.19178*height))
        path.addCurve(to: CGPoint(x: 0.48394*width, y: 0.14323*height), control1: CGPoint(x: 0.50675*width, y: 0.1625*height), control2: CGPoint(x: 0.49512*width, y: 0.15095*height))
        path.addCurve(to: CGPoint(x: 0.44936*width, y: 0.13097*height), control1: CGPoint(x: 0.47216*width, y: 0.13509*height), control2: CGPoint(x: 0.46053*width, y: 0.13097*height))
        path.move(to: CGPoint(x: 0.44936*width, y: 0.12606*height))
        path.addCurve(to: CGPoint(x: 0.71282*width, y: 0.63617*height), control1: CGPoint(x: 0.54218*width, y: 0.12606*height), control2: CGPoint(x: 0.63689*width, y: 0.40297*height))
        path.addCurve(to: CGPoint(x: 0.95123*width, y: 1.12607*height), control1: CGPoint(x: 0.81285*width, y: 0.9434*height), control2: CGPoint(x: 0.95123*width, y: 1.12607*height))
        path.addLine(to: CGPoint(x: -0.04877*width, y: 1.12607*height))
        path.addCurve(to: CGPoint(x: 0.18895*width, y: 0.63836*height), control1: CGPoint(x: -0.04877*width, y: 1.12607*height), control2: CGPoint(x: 0.08913*width, y: 0.94591*height))
        path.addCurve(to: CGPoint(x: 0.44936*width, y: 0.12606*height), control1: CGPoint(x: 0.26472*width, y: 0.40487*height), control2: CGPoint(x: 0.3561*width, y: 0.12606*height))
        path.closeSubpath()
        return path
    }
}
struct TabBarTow: View {
   @State var selectedTab:Tap = .home
   var body: some View {
       VStack{
           HStack{
               ForEach(tapItems) { item in
                   Button(action: {
                       withAnimation{
                           selectedTab = item.tap
                       }
                      
                   }, label: {
                      
                           Image(systemName: item.icon)
                               .symbolVariant(.fill)
                               .font(selectedTab == item.tap ? .title2 : .title3)
                       .frame(maxWidth: .infinity)
                       .offset(y:selectedTab == item.tap ? -10 : 0)
                   })
                   .foregroundStyle(selectedTab == item.tap ? .black:.gray)
               }
           }
           .frame( height: 80)
           .background(
                   RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(.white)
           )
           .overlay(alignment: .bottom) {
               HStack{
                   if selectedTab == .maginf{Spacer()}
                   if selectedTab == .rect{Spacer()}
                   if selectedTab == .bell {
                       Spacer()
                       Spacer()
                   }
               MyCustomShape()
                       .frame(width: 60, height: 15)
                       .foregroundColor(.black)
                           .frame(width: 60)
                           .padding(.leading)
                           .padding(.trailing,6)
                   if selectedTab == .home{Spacer()}
                   if selectedTab == .maginf{
                       Spacer()
                       Spacer()

                   }
                   if selectedTab == .bell {Spacer()}
               }
               .offset(y: -2)
           }
      
         
       }
           .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
//           .frame(maxHeight: .infinity,alignment: .bottom)
           .padding(.horizontal)
//           .edgesIgnoringSafeArea(.bottom)
           .frame(maxHeight: .infinity,alignment: .bottom)
      
      
   }
}

struct TabBarTow_Previews: PreviewProvider {
   static var previews: some View {
       TabBarTow()
   }
}
