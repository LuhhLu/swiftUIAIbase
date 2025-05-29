 

import SwiftUI

struct HomeView: View {
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    var body: some View {
        ZStack{
            HStack{
                Button("Error") {
                    withAnimation {
                        show.toggle()
                    }
                    
                  
                }
                Button("Success") {
                    withAnimation {
                        show2.toggle()
                    }
                    
                  
                }
                Button("Warning") {
                    withAnimation {
                        show3.toggle()
                    }
                    
                  
                }
            }
            ContentView(show: $show, icon: .er, text: "Error", gridentcolor: .red, circleAColor: .red, details: "This is Error message")
            ContentView(show: $show2, icon: .su, text: "Success", gridentcolor: .green, circleAColor: .green, details: "This is Success message")
            ContentView(show: $show3, icon: .wa, text: "Warning", gridentcolor: .yellow, circleAColor: .yellow, details: "This is Warning message")
        }
    }
}

#Preview {
    HomeView()
}
