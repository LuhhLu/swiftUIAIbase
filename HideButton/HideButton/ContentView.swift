 
struct ToDo:Identifiable{
    var id = UUID()
    var titel:String
    var detils:String
}


import SwiftUI

struct ContentView: View {
    @State var show  = false
    @State var showTF  = false
    @State var movethebutton = false
    @State var scrollPadding:CGFloat = 10
    @State private var firstItemOffset: CGFloat = 0
    @State private var items: [ToDo] = [
          ToDo(titel: "one", detils: "strinh"),
          ToDo(titel: "tow", detils: "strinh"),
          ToDo(titel: "three", detils: "strinh")
      ]
    var body: some View {
        ZStack {
            

            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(items.indices,id:\.self) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).frame(width: 150, height: 200)
                                .background(
                                    GeometryReader { geometry -> Color in
                                        if index == 0 {
                                            DispatchQueue.main.async {
                                                firstItemOffset = geometry.frame(in: .global).minX
                                                if firstItemOffset >= 50 && !movethebutton{
                                                    withAnimation(.spring()) {
                                                        scrollPadding = 80
                                                        movethebutton = true
                                                       
                                                    }
                                                }else if firstItemOffset < 80 && movethebutton{
                                                    withAnimation {
                                                        movethebutton = false
                                                        scrollPadding = 12
                                                    }
                                                }
                                            }
                                        }
                                        return Color.clear
                                    }
                                )
                            Text(items[index].titel).foregroundColor(.white).bold()
                            
                        }
                    }
                }
                .padding(.horizontal,scrollPadding)
            }
            .overlay(alignment: .leading) {
                Button {
                    withAnimation {
                        show.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            showTF.toggle()
                        }
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 60, height: 200)
                            .foregroundColor(.gray.opacity(0.5))
                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 0)
                        Image(systemName: "plus").font(.largeTitle).foregroundColor(.black)
                    }
                }
                .offset(x: movethebutton ? 10 : -120)

            }
            if show{
                AddView(show: $show, showTF: $showTF, items: $items)
            }
            Text("offset\(String(format: "%.2f", firstItemOffset))")
                .offset(y: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
