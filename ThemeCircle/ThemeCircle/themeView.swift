import SwiftUI

struct themeView: View {
    @State var colortheme = 0
    var body: some View {
        VStack {
 
            ZStack{
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 230, height: 430)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(lineWidth: 3)
                    .frame(width: 230, height: 430)
                    .foregroundColor(.black)
                    .overlay(alignment: .topLeading) {
                            VStack(spacing: 20) {
                                HStack(alignment: .bottom){
                                    Circle()
                                        .frame(width: 30, height: 30)
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .frame(width: 140, height: 40)
                                    Spacer()
                                }
                                .foregroundColor(Colors[colortheme].color)
                                
                            
                                HStack(alignment: .bottom){
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .frame(width: 140, height: 40)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                  
                                }
                                .foregroundColor(.gray)
                            }
                            .padding()
                        .padding(.top,20)
                    }
                    .background(Colors[colortheme].color.opacity(0.3),in:RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
            }
            .padding(.top,100)
            ContentView(indexColor: $colortheme)
           
           
        }
       
    }
}

struct themeView_Previews: PreviewProvider {
    static var previews: some View {
        themeView()
    }
}
