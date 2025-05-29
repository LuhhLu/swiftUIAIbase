

import SwiftUI

struct HomeView: View {
    @State var show = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading,spacing: 20){
                    HStack{
                        SideBarIconA(show: $show)
                            .offset(y: 4)
                        Spacer()
                            searchbaricon()
                        profile()
                        
                    }
                    .padding(.horizontal)
                    HImageView()
                    Text("Added recently").bold()
                        .font(.title)
                        .padding(.leading)
                imagegrid()
                     
                    
                    
                }
            }
            .overlay(alignment: .bottom) {
                TabBarView()
                    .offset(y: 20)
            }
            .offset(x: show ? 255 : 0)
            .overlay {
                sidemenuview()
                    .offset(x: show ? 0 : -270)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct profile: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            Image(systemName: "person").bold()
                .font(.title2)
        }
    }
}
