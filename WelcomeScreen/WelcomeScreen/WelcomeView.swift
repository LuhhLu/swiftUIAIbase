import SwiftUI

struct WelcomeView: View {
    @Binding var BColor : Double
    @Binding var blurNum:Int
    @Binding var show:Bool
    @State var dragAmount = CGSize.zero
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment:.leading, spacing: 15){
                VStack{
                    Image(.im).resizable().scaledToFill()
                        .frame(width:80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("Welcome to Your App!").font(.title2).bold()
                }
                .frame(maxWidth: .infinity)
               
                
                HStack{
                    Image(systemName: "house.fill")
                    Text("The central hub for your needs.")
                }
                HStack {
                    Image(systemName: "person.2.fill")
                    Text("Connect with your community and  do more  with this app")
                }
                HStack {
                    Image(systemName: "calendar")
                    Text("Stay updated with events. and learn more with swiftui")
                }
                Button(action: {
                    withAnimation {
                        show = false
                        blurNum = 0
                        BColor = 0
                    }
                }, label: {
                    Text("Get Started").bold().padding()
                        .frame(width: 350, height: 50)
                        .background(Capsule().fill(Color.gray.opacity(0.1)))
                })
                .tint(.purple)
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
            }
            .padding(13)
            .background(.white,in:RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .offset(y: show ? 10 + dragAmount.height : 450 )
            .gesture(DragGesture()
                .onChanged({ value in
                    if value .translation.height > 0 {
                        dragAmount = value.translation
                        let blurDecreas = value.translation.height / 10
                        blurNum = Int(max(0,10 - blurDecreas))
                        let bcolor = value.translation.height / 2000
                        BColor = max(0, 0.2 - bcolor)
                        
                    }
                })
                    .onEnded({ value in
                        if dragAmount.height > 100 {
                            withAnimation {
                                show = false
                                blurNum = 0
                                BColor = 0
                            }
                        }
                        withAnimation {
                            dragAmount = .zero
                            if show{
                                blurNum = 10
                                BColor = 0.2
                            }
                            
                        }
                    })
            )
            
            
        }
        
    }
}

#Preview {
    WelcomeView(BColor: .constant(0.2), blurNum: .constant(10),show: .constant(true))
}
