
import SwiftUI

struct MyCustomShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 1.99738*height))
        path.addCurve(to: CGPoint(x: 0.44893*width, y: 1.99222*height), control1: CGPoint(x: 0.48296*width, y: 1.99738*height), control2: CGPoint(x: 0.46578*width, y: 1.99564*height))
        path.addCurve(to: CGPoint(x: 0.39933*width, y: 1.9771*height), control1: CGPoint(x: 0.43232*width, y: 1.98885*height), control2: CGPoint(x: 0.41564*width, y: 1.98377*height))
        path.addCurve(to: CGPoint(x: 0.35146*width, y: 1.9525*height), control1: CGPoint(x: 0.38324*width, y: 1.97052*height), control2: CGPoint(x: 0.36714*width, y: 1.96224*height))
        path.addCurve(to: CGPoint(x: 0.30557*width, y: 1.91894*height), control1: CGPoint(x: 0.33597*width, y: 1.94287*height), control2: CGPoint(x: 0.32053*width, y: 1.93158*height))
        path.addCurve(to: CGPoint(x: 0.26191*width, y: 1.8769*height), control1: CGPoint(x: 0.29076*width, y: 1.90641*height), control2: CGPoint(x: 0.27606*width, y: 1.89227*height))
        path.addCurve(to: CGPoint(x: 0.22073*width, y: 1.8269*height), control1: CGPoint(x: 0.24785*width, y: 1.86164*height), control2: CGPoint(x: 0.234*width, y: 1.84482*height))
        path.addCurve(to: CGPoint(x: 0.18227*width, y: 1.76944*height), control1: CGPoint(x: 0.20752*width, y: 1.80907*height), control2: CGPoint(x: 0.19458*width, y: 1.78974*height))
        path.addCurve(to: CGPoint(x: 0.1468*width, y: 1.70502*height), control1: CGPoint(x: 0.16999*width, y: 1.74919*height), control2: CGPoint(x: 0.15806*width, y: 1.72752*height))
        path.addCurve(to: CGPoint(x: 0.11456*width, y: 1.63413*height), control1: CGPoint(x: 0.13554*width, y: 1.68251*height), control2: CGPoint(x: 0.12469*width, y: 1.65866*height))
        path.addCurve(to: CGPoint(x: 0.08581*width, y: 1.55729*height), control1: CGPoint(x: 0.1044*width, y: 1.60953*height), control2: CGPoint(x: 0.09473*width, y: 1.58368*height))
        path.addCurve(to: CGPoint(x: 0.06079*width, y: 1.47498*height), control1: CGPoint(x: 0.07684*width, y: 1.53076*height), control2: CGPoint(x: 0.06842*width, y: 1.50307*height))
        path.addCurve(to: CGPoint(x: 0.03975*width, y: 1.38773*height), control1: CGPoint(x: 0.0531*width, y: 1.4467*height), control2: CGPoint(x: 0.04602*width, y: 1.41734*height))
        path.addCurve(to: CGPoint(x: 0.02296*width, y: 1.29602*height), control1: CGPoint(x: 0.03343*width, y: 1.35784*height), control2: CGPoint(x: 0.02778*width, y: 1.32699*height))
        path.addCurve(to: CGPoint(x: 0.01065*width, y: 1.20036*height), control1: CGPoint(x: 0.01808*width, y: 1.2647*height), control2: CGPoint(x: 0.01394*width, y: 1.23252*height))
        path.addCurve(to: CGPoint(x: 0.00308*width, y: 1.10125*height), control1: CGPoint(x: 0.00731*width, y: 1.16778*height), control2: CGPoint(x: 0.00477*width, y: 1.13443*height))
        path.addCurve(to: CGPoint(x: 0.0005*width, y: 1.00014*height), control1: CGPoint(x: 0.00138*width, y: 1.06789*height), control2: CGPoint(x: 0.00052*width, y: 1.03388*height))
        path.addCurve(to: CGPoint(x: 0.47463*width, y: 0.99938*height), control1: CGPoint(x: 0.01208*width, y: 0.99961*height), control2: CGPoint(x: 0.24496*width, y: 0.99938*height))
        path.addCurve(to: CGPoint(x: 0.9995*width, y: 1.00015*height), control1: CGPoint(x: 0.72248*width, y: 0.99938*height), control2: CGPoint(x: 0.98708*width, y: 0.99965*height))
        path.addCurve(to: CGPoint(x: 0.99692*width, y: 1.10125*height), control1: CGPoint(x: 0.99948*width, y: 1.03388*height), control2: CGPoint(x: 0.99862*width, y: 1.06789*height))
        path.addCurve(to: CGPoint(x: 0.98935*width, y: 1.20036*height), control1: CGPoint(x: 0.99523*width, y: 1.13443*height), control2: CGPoint(x: 0.99269*width, y: 1.16778*height))
        path.addCurve(to: CGPoint(x: 0.97704*width, y: 1.29602*height), control1: CGPoint(x: 0.98606*width, y: 1.23252*height), control2: CGPoint(x: 0.98192*width, y: 1.2647*height))
        path.addCurve(to: CGPoint(x: 0.96025*width, y: 1.38773*height), control1: CGPoint(x: 0.97222*width, y: 1.32699*height), control2: CGPoint(x: 0.96657*width, y: 1.35784*height))
        path.addCurve(to: CGPoint(x: 0.93921*width, y: 1.47498*height), control1: CGPoint(x: 0.95398*width, y: 1.41734*height), control2: CGPoint(x: 0.9469*width, y: 1.4467*height))
        path.addCurve(to: CGPoint(x: 0.91419*width, y: 1.55729*height), control1: CGPoint(x: 0.93158*width, y: 1.50307*height), control2: CGPoint(x: 0.92316*width, y: 1.53076*height))
        path.addCurve(to: CGPoint(x: 0.88544*width, y: 1.63413*height), control1: CGPoint(x: 0.90527*width, y: 1.58368*height), control2: CGPoint(x: 0.8956*width, y: 1.60953*height))
        path.addCurve(to: CGPoint(x: 0.8532*width, y: 1.70502*height), control1: CGPoint(x: 0.87531*width, y: 1.65866*height), control2: CGPoint(x: 0.86446*width, y: 1.68251*height))
        path.addCurve(to: CGPoint(x: 0.81773*width, y: 1.76944*height), control1: CGPoint(x: 0.84194*width, y: 1.72752*height), control2: CGPoint(x: 0.83001*width, y: 1.74919*height))
        path.addCurve(to: CGPoint(x: 0.77927*width, y: 1.8269*height), control1: CGPoint(x: 0.80542*width, y: 1.78974*height), control2: CGPoint(x: 0.79248*width, y: 1.80907*height))
        path.addCurve(to: CGPoint(x: 0.73809*width, y: 1.8769*height), control1: CGPoint(x: 0.766*width, y: 1.84482*height), control2: CGPoint(x: 0.75215*width, y: 1.86164*height))
        path.addCurve(to: CGPoint(x: 0.69443*width, y: 1.91894*height), control1: CGPoint(x: 0.72394*width, y: 1.89227*height), control2: CGPoint(x: 0.70924*width, y: 1.90641*height))
        path.addCurve(to: CGPoint(x: 0.64854*width, y: 1.9525*height), control1: CGPoint(x: 0.67947*width, y: 1.93158*height), control2: CGPoint(x: 0.66403*width, y: 1.94287*height))
        path.addCurve(to: CGPoint(x: 0.60067*width, y: 1.9771*height), control1: CGPoint(x: 0.63286*width, y: 1.96224*height), control2: CGPoint(x: 0.61676*width, y: 1.97052*height))
        path.addCurve(to: CGPoint(x: 0.55107*width, y: 1.99222*height), control1: CGPoint(x: 0.58436*width, y: 1.98377*height), control2: CGPoint(x: 0.56768*width, y: 1.98885*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 1.99738*height), control1: CGPoint(x: 0.53422*width, y: 1.99564*height), control2: CGPoint(x: 0.51704*width, y: 1.99738*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.47463*width, y: 1.00038*height))
        path.addCurve(to: CGPoint(x: 0.001*width, y: 1.00112*height), control1: CGPoint(x: 0.2477*width, y: 1.00038*height), control2: CGPoint(x: 0.01731*width, y: 1.00061*height))
        path.addCurve(to: CGPoint(x: 0.00358*width, y: 1.10115*height), control1: CGPoint(x: 0.00103*width, y: 1.0345*height), control2: CGPoint(x: 0.0019*width, y: 1.06814*height))
        path.addCurve(to: CGPoint(x: 0.01114*width, y: 1.20016*height), control1: CGPoint(x: 0.00526*width, y: 1.1343*height), control2: CGPoint(x: 0.00781*width, y: 1.16761*height))
        path.addCurve(to: CGPoint(x: 0.02343*width, y: 1.29572*height), control1: CGPoint(x: 0.01443*width, y: 1.23229*height), control2: CGPoint(x: 0.01856*width, y: 1.26444*height))
        path.addCurve(to: CGPoint(x: 0.04021*width, y: 1.38734*height), control1: CGPoint(x: 0.02825*width, y: 1.32666*height), control2: CGPoint(x: 0.03389*width, y: 1.35748*height))
        path.addCurve(to: CGPoint(x: 0.06123*width, y: 1.47451*height), control1: CGPoint(x: 0.04647*width, y: 1.41692*height), control2: CGPoint(x: 0.05354*width, y: 1.44625*height))
        path.addCurve(to: CGPoint(x: 0.08622*width, y: 1.55673*height), control1: CGPoint(x: 0.06885*width, y: 1.50257*height), control2: CGPoint(x: 0.07726*width, y: 1.53023*height))
        path.addCurve(to: CGPoint(x: 0.11495*width, y: 1.63349*height), control1: CGPoint(x: 0.09514*width, y: 1.5831*height), control2: CGPoint(x: 0.1048*width, y: 1.60892*height))
        path.addCurve(to: CGPoint(x: 0.14715*width, y: 1.70431*height), control1: CGPoint(x: 0.12507*width, y: 1.658*height), control2: CGPoint(x: 0.1359*width, y: 1.68183*height))
        path.addCurve(to: CGPoint(x: 0.18259*width, y: 1.76867*height), control1: CGPoint(x: 0.1584*width, y: 1.72679*height), control2: CGPoint(x: 0.17033*width, y: 1.74844*height))
        path.addCurve(to: CGPoint(x: 0.22101*width, y: 1.82608*height), control1: CGPoint(x: 0.19489*width, y: 1.78895*height), control2: CGPoint(x: 0.20781*width, y: 1.80826*height))
        path.addCurve(to: CGPoint(x: 0.26215*width, y: 1.87602*height), control1: CGPoint(x: 0.23426*width, y: 1.84398*height), control2: CGPoint(x: 0.24811*width, y: 1.86078*height))
        path.addCurve(to: CGPoint(x: 0.30577*width, y: 1.91802*height), control1: CGPoint(x: 0.27629*width, y: 1.89138*height), control2: CGPoint(x: 0.29096*width, y: 1.9055*height))
        path.addCurve(to: CGPoint(x: 0.35161*width, y: 1.95155*height), control1: CGPoint(x: 0.32071*width, y: 1.93064*height), control2: CGPoint(x: 0.33613*width, y: 1.94193*height))
        path.addCurve(to: CGPoint(x: 0.39943*width, y: 1.97612*height), control1: CGPoint(x: 0.36727*width, y: 1.96128*height), control2: CGPoint(x: 0.38336*width, y: 1.96955*height))
        path.addCurve(to: CGPoint(x: 0.44898*width, y: 1.99123*height), control1: CGPoint(x: 0.41572*width, y: 1.98278*height), control2: CGPoint(x: 0.43239*width, y: 1.98786*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 1.99638*height), control1: CGPoint(x: 0.46581*width, y: 1.99465*height), control2: CGPoint(x: 0.48298*width, y: 1.99638*height))
        path.addCurve(to: CGPoint(x: 0.55102*width, y: 1.99123*height), control1: CGPoint(x: 0.51702*width, y: 1.99638*height), control2: CGPoint(x: 0.53419*width, y: 1.99465*height))
        path.addCurve(to: CGPoint(x: 0.60057*width, y: 1.97612*height), control1: CGPoint(x: 0.56761*width, y: 1.98786*height), control2: CGPoint(x: 0.58428*width, y: 1.98278*height))
        path.addCurve(to: CGPoint(x: 0.64839*width, y: 1.95155*height), control1: CGPoint(x: 0.61664*width, y: 1.96955*height), control2: CGPoint(x: 0.63273*width, y: 1.96128*height))
        path.addCurve(to: CGPoint(x: 0.69423*width, y: 1.91802*height), control1: CGPoint(x: 0.66387*width, y: 1.94193*height), control2: CGPoint(x: 0.67929*width, y: 1.93064*height))
        path.addCurve(to: CGPoint(x: 0.73785*width, y: 1.87602*height), control1: CGPoint(x: 0.70904*width, y: 1.9055*height), control2: CGPoint(x: 0.72371*width, y: 1.89138*height))
        path.addCurve(to: CGPoint(x: 0.77899*width, y: 1.82608*height), control1: CGPoint(x: 0.75189*width, y: 1.86078*height), control2: CGPoint(x: 0.76574*width, y: 1.84398*height))
        path.addCurve(to: CGPoint(x: 0.81741*width, y: 1.76867*height), control1: CGPoint(x: 0.79219*width, y: 1.80826*height), control2: CGPoint(x: 0.80511*width, y: 1.78895*height))
        path.addCurve(to: CGPoint(x: 0.85285*width, y: 1.70431*height), control1: CGPoint(x: 0.82967*width, y: 1.74844*height), control2: CGPoint(x: 0.8416*width, y: 1.72679*height))
        path.addCurve(to: CGPoint(x: 0.88505*width, y: 1.63349*height), control1: CGPoint(x: 0.8641*width, y: 1.68183*height), control2: CGPoint(x: 0.87493*width, y: 1.658*height))
        path.addCurve(to: CGPoint(x: 0.91378*width, y: 1.55673*height), control1: CGPoint(x: 0.8952*width, y: 1.60892*height), control2: CGPoint(x: 0.90486*width, y: 1.5831*height))
        path.addCurve(to: CGPoint(x: 0.93877*width, y: 1.47451*height), control1: CGPoint(x: 0.92274*width, y: 1.53023*height), control2: CGPoint(x: 0.93115*width, y: 1.50257*height))
        path.addCurve(to: CGPoint(x: 0.95979*width, y: 1.38734*height), control1: CGPoint(x: 0.94646*width, y: 1.44625*height), control2: CGPoint(x: 0.95353*width, y: 1.41692*height))
        path.addCurve(to: CGPoint(x: 0.97657*width, y: 1.29572*height), control1: CGPoint(x: 0.96611*width, y: 1.35748*height), control2: CGPoint(x: 0.97175*width, y: 1.32666*height))
        path.addCurve(to: CGPoint(x: 0.98886*width, y: 1.20016*height), control1: CGPoint(x: 0.98144*width, y: 1.26444*height), control2: CGPoint(x: 0.98557*width, y: 1.23229*height))
        path.addCurve(to: CGPoint(x: 0.99642*width, y: 1.10115*height), control1: CGPoint(x: 0.99219*width, y: 1.16761*height), control2: CGPoint(x: 0.99474*width, y: 1.1343*height))
        path.addCurve(to: CGPoint(x: 0.999*width, y: 1.00113*height), control1: CGPoint(x: 0.9981*width, y: 1.06815*height), control2: CGPoint(x: 0.99897*width, y: 1.03451*height))
        path.addCurve(to: CGPoint(x: 0.47463*width, y: 1.00038*height), control1: CGPoint(x: 0.98149*width, y: 1.00064*height), control2: CGPoint(x: 0.71967*width, y: 1.00038*height))
        path.move(to: CGPoint(x: 0.47463*width, y: 0.99838*height))
        path.addCurve(to: CGPoint(x: width, y: 0.99919*height), control1: CGPoint(x: 0.73282*width, y: 0.99838*height), control2: CGPoint(x: width, y: 0.99867*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 1.99838*height), control1: CGPoint(x: width, y: 1.55103*height), control2: CGPoint(x: 0.77614*width, y: 1.99838*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.99919*height), control1: CGPoint(x: 0.22386*width, y: 1.99838*height), control2: CGPoint(x: 0, y: 1.55103*height))
        path.addCurve(to: CGPoint(x: 0.47463*width, y: 0.99838*height), control1: CGPoint(x: 0, y: 0.99863*height), control2: CGPoint(x: 0.2334*width, y: 0.99838*height))
        path.closeSubpath()
        return path
    }
}
struct TabBarThree: View {
    @State var selectedTab:Tap = .home
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
             .foregroundColor(.white)
             .frame( height: 60)
            HStack{
                if selectedTab == .maginf{Spacer()}
                if selectedTab == .rect{Spacer()}
                if selectedTab == .bell {
                    Spacer()
                    Spacer()
                }
            MyCustomShape2()
                    .frame(width: 61, height: 33)
                    .foregroundColor(.black)
                        .frame(width: 60)
                        .padding(.leading,12)
                        .padding(.trailing,12)
                if selectedTab == .home{Spacer()}
                if selectedTab == .maginf{
                    Spacer()
                    Spacer()

                }
                if selectedTab == .bell {Spacer()}
            }
            .offset(y: -50)
            HStack{
                ForEach(tapItems) { item in
                    Button(action: {
                        withAnimation(.spring()){
                            selectedTab = item.tap
                        }
                    }, label: {
                        ZStack{
                            Circle()
//                                .stroke(lineWidth: 2)
                                .frame(height: 45)
                                .foregroundColor(selectedTab == item.tap ? .white : .clear)
                                .shadow(radius: 2)
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(selectedTab == item.tap ? .title2 : .title3)
                        .frame(maxWidth: .infinity)
                       
                        }
                        .offset(y:selectedTab == item.tap ? -30 : 0)
                           
                    })
                    .foregroundStyle(selectedTab == item.tap ? .black:.gray)
                }
            }
          
         
            
            
            
       
          
        }
            .padding(.horizontal)
            .frame(maxHeight: .infinity,alignment: .bottom)
    }
}
struct TabBarThree_Previews: PreviewProvider {
    static var previews: some View {
        TabBarThree()
    }
}
