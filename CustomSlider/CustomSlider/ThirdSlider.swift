



import SwiftUI

struct ThirdSlider: View {
    @State  var value:Double = 0.5
    var body: some View {
     
            
        VStack {
        
            GeometryReader{ geometry in
                    ZStack(alignment: .leading) {
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: geometry.size.width, height: 10)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("sl"))
                                .frame(width: geometry.size.width, height: 10)
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .frame(width: geometry.size.width, height: 10)
                        }
                        ZStack{
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("ic"),Color("oc")]), startPoint: .leading, endPoint: .trailing))
                            Circle()
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black,Color("oc")]), startPoint: .trailing, endPoint: .leading))
                                .frame(width: 30, height: 30)
                           Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(Color("sl"))
                            
                        }
                        .offset(x: CGFloat(value) * geometry.size.width - 30)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { gesture in
                                    updateValue(with: gesture, in: geometry)
                                }
                        )
                    }
                  
                }
                .padding(.horizontal,40)
            .frame(height: 40)
            Text("Value : \(value, specifier: "%.2f")")
        }
        
      
    }
    private func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        value = min(max(Double(newValue), 0), 1)
    }
}

struct ThirdSlider_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSlider()
    }
}
