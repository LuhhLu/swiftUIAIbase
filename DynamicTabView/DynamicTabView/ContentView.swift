 

import SwiftUI

struct TabModel:Identifiable{
    var id = UUID()
    var icon:String
    var title:String
}
struct ContentView: View {
    var taps:[TabModel] = [
        TabModel(icon: "person", title: "Accounts"),//0
        TabModel(icon: "house", title: "Home"),//1
        TabModel(icon: "creditcard", title: "Payments"),//2
        TabModel(icon: "arrow.right.arrow.left", title: "Transfers")//3
        
    ]
    @State var selectedTab = 0
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                //0
                redVeiw()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //1
                blueVeiw()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //2
                greenview()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                //3
                grayview()
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
            }
            .offset(x: -geo.size.width * CGFloat(selectedTab))
        //thank you have nice day 
        }
        .overlay(alignment: .bottom) {
            HStack{
                ForEach(taps.indices,id:\.self) { tap in
                    HStack(spacing: 14) {
                        Image(systemName:taps[tap].icon)
                        //now  selectedTabis 0
                        if selectedTab == tap {
                            Text(taps[tap].title).bold()
                                .transition(.scale(scale: 0, anchor: .trailing).combined(with: .opacity))
                        }
                       
                    }
                    .font(.title2)
                    .frame(maxWidth: selectedTab == tap ? .infinity : 55)
                    .frame(height: 55)
                    .background(Color(.systemGray6),in:.rect(cornerRadius: 12))
                    .clipped()
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tap
                        }
                    }
                    
                }
            }
            .padding(.horizontal)
         
        }
    }
}

#Preview {
    ContentView()
}
struct redVeiw: View {
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            Text("RedVeiw").font(.largeTitle)
        }
    }
}
struct blueVeiw: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            Text("BlueVeiw").font(.largeTitle)
        }
    }
}
struct greenview: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("GreenVeiw").font(.largeTitle)
        }
    }
}
struct grayview: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            Text("GrayVeiw").font(.largeTitle)
        }
    }
}
struct yellowview: View {
    var body: some View {
        ZStack{
            Color.yellow.ignoresSafeArea()
            Text("YellowVeiw").font(.largeTitle)
        }
    }
}
