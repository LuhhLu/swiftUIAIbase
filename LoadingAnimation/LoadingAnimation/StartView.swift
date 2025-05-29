 

import SwiftUI

struct StartView: View {
    @State  var show = false
    @State  var navigateToHome = false
    var body: some View {
        NavigationStack{
            VStack {
               Spacer()
                if show{
                    AnimationView()
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        show = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            show = false
                            navigateToHome = true
                        }
                        
                    }
                    
                }, label: {
                    Text("Start").bold().foregroundStyle(.white)
                        .frame(width: 150, height: 50)
                        .background(Color("DLB"),in: RoundedRectangle(cornerRadius: 15))
                    
                })
                .opacity(show ? 0.3 : 1)
                .disabled(show)
               
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
        
      
    }
}

#Preview {
    StartView()
}
