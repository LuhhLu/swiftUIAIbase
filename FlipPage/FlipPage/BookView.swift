import SwiftUI

struct BookView: View {
    @State var show = false
    @State var show2 = false
    @State var move = false
    @State var close = false
    @State var isAnimating = false

    var body: some View {
            ZStack {
                ZStack{
                    pageone()
                    behind(show2: $show2, close: $close)
                        Rectangle().foregroundStyle(.black)
                            .opacity(0.7)
                            .frame(width: 1)
                            .frame(height: 263)
                            .blur(radius: 5)
                            .offset(x: -90)
                }

                  
            BookCover(show: $show)
            }
           
            .offset(x: move ? 90 : 0)
            .onTapGesture {
                if !isAnimating {
                    toggleAnimations()
                }
            }   
    }
      func toggleAnimations() {
        isAnimating = true

        if show {
            // Closing animation
            withAnimation(.linear(duration: 1).delay(0.49)) {
                show.toggle()
            }
            
            withAnimation(.linear(duration: 1)) {
                show2.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.49) {
                close = true
            }
            withAnimation(.linear(duration: 0.4).delay(0.4)) {
                move.toggle()
            }
        } else {
            // Opening animation
            close = false
            withAnimation(.linear(duration: 0.5)) {
                show.toggle()
            }
            withAnimation(.linear(duration: 1)) {
                show2.toggle()
            }
            
            withAnimation(.linear(duration: 0.4).delay(0.4)) {
                move.toggle()
            }
        }
        
        // Reset the animation flag after the animations complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isAnimating = false
        }
    }
}

//#Preview {
//    BookView()
//}
#Preview {
    TabViews()
}

struct pageone: View {
    var body: some View {
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 8, topTrailingRadius: 8, style: .continuous)
                .frame(width: 180, height: 263)
//                .foregroundStyle(.shadow(.inner(color:.black.opacity(0.6), radius: 20, x: 0, y: 0)))
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Introduction").bold()
                    .font(.system(size: 15))
                Text("SwiftUI is a modern, declarative framework introduced by Apple in 2019 for building user interfaces across all Apple platforms, including iOS, macOS, watchOS, and tvOS. It allows developers to create UIs with Swift code in a way that is easy to read and write. SwiftUI leverages a declarative syntax, meaning you simply describe what your UI should look like and how it should behave, and SwiftUI takes care of the rest.")
                    .font(.system(size: 9))
                    .lineSpacing(5)
            }
            .frame(width: 170, height: 220)
            .foregroundStyle(.gray)
    }
}

struct behind: View {
    @Binding var show2 :Bool
    @Binding var close:Bool
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 8, topTrailingRadius: 8, style: .continuous)
                .frame(width: 180, height: 263)
                .foregroundStyle(.white)
            Group {
                VStack(spacing: 26) {
                    Text("SWIFTUI").font(.title.bold())
                    VStack {
                        Text("450").font(.largeTitle)
                        Text("pages")
                    }
                }
            }
            .foregroundStyle(.gray)
            .rotation3DEffect(
                .degrees(-180),
                axis: (x: 0, y: 1, z: 0)
            )
        }
        .rotation3DEffect(
            .degrees(show2 ? -180 : 0),
            axis: (x: 0, y: 1, z: 0),
            anchor: .leading,
            anchorZ: 0,
            perspective: 0.3
        )
        .opacity(close ? 0 : 1)
    }
}
struct BookCover: View {
    @Binding var show:Bool
    var body: some View {
 
        Image("book").resizable().scaledToFill()
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 8, topTrailingRadius: 8, style: .continuous))
            .frame(width: 180, height: 264)
            .rotation3DEffect(
                .degrees(show ? -90 : 0),
                axis: (x: 0, y: 1, z: 0),
                anchor: .leading,
                anchorZ: 0,
                perspective: 0.3
            )
    }
}

 













//
//
//
//
//import SwiftUI
//
//struct ContentView: View {
//   @State var show = true
//   @State var show2 = true
//    @State var move = true
//    @State var close = false
//   var body: some View {
//       ZStack {
//         
//           UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous)
//               .frame(width: 150, height: 220)
//               .foregroundStyle(.blue.gradient)
//           ZStack{
//              
//               UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous)
//                   .frame(width: 150, height: 220)
//                   .foregroundStyle(.black.gradient)
//               Group{
//                   VStack(spacing:26){
//                       Text("SWIFTUI").font(.title.bold())
//                       VStack{
//                           Text("450").font(.largeTitle)
//                           Text("pages")
//                       }
//                   }
//               }
//                   .foregroundStyle(.white)
//                   .rotation3DEffect(
//                       .degrees(-180 ),
//                        axis: (x: 0, y: 1, z: 0)
//                   )
//           }
//           
//               .rotation3DEffect(
//                   .degrees(show2 ? -180 : 0),
//                                         axis: (x: 0, y: 1, z: 0),
//                   anchor: .leading,
//                                         anchorZ: 0,
//                   perspective: 0.3
//               )
//               .opacity(close ? 0 : 1)
//           Image(.book).resizable().scaledToFill()
//               .frame(width: 150, height: 220)
//               .clipShape(  UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous))
//               .rotation3DEffect(
//                   .degrees(show ? -90 : 0),
//                      axis: (x: 0, y: 1, z: 0),
//                      anchor: .leading,
//                      anchorZ: 0,
//                   perspective: 0.3
//               )
//     
//       }
//       .offset(x:move ?  74 : 0)
//       .onTapGesture {
//           withAnimation(.linear(duration: 1).delay(0.49)) {
//               show.toggle()
//           }
//           withAnimation(.linear(duration: 1) ) {
//               show2.toggle()
//           }
//           DispatchQueue.main.asyncAfter(deadline: .now() + 0.49){
//               close = true
//           }
//           withAnimation(.linear(duration: 0.5).delay(0.5)) {
//               move.toggle()
//           }
//       }
//       .padding()
//   }
//}
//
//#Preview {
//   ContentView()
//}
//
//
//


//
//
//
//
//
//import SwiftUI
//
//struct ContentView: View {
//   @State var show = false
//   @State var show2 = false
//   var body: some View {
//       ZStack {
//           RoundedRectangle(cornerRadius: 12)
//               .frame(width: 250, height: 300)
//               .rotation3DEffect(
//                   .degrees(show2 ? -180 : 0),
//                                         axis: (x: 0, y: 1, z: 0),
//                   anchor: .leading,
//                                         anchorZ: 0,
//                   perspective: 0.5
//               )
//           
//           Image(.book).resizable().scaledToFill()
//               .frame(width: 250, height: 300)
//               .clipShape(.rect(cornerRadius: 12))
//               .rotation3DEffect(
//                   .degrees(show ? -90 : 0),
//                      axis: (x: 0, y: 1, z: 0),
//                      anchor: .leading,
//                      anchorZ: 0,
//                   perspective: 0.5
//               )
//     
//       }
//       .onTapGesture {
//           withAnimation(.linear(duration: 1)) {
//               show.toggle()
//           }
//           withAnimation(.linear(duration: 2) ) {
//               show2.toggle()
//           }
//       }
//       .padding()
//   }
//}
//
//#Preview {
//   ContentView()
//}



//V2
//
//
//
//
//import SwiftUI
//
//struct ContentView: View {
//   @State var show = false
//   @State var show2 = false
//   var body: some View {
//       ZStack {
//           ZStack{
//               RoundedRectangle(cornerRadius: 12)
//                   .frame(width: 220, height: 280)
//                   .foregroundStyle(.black.gradient)
//               Group{
//                   VStack(spacing:26){
//                       Text("SWIFTUI").font(.title.bold())
//                       VStack{
//                           Text("450").font(.largeTitle)
//                           Text("pages")
//                       }
//                   }
//               }
//                   .foregroundStyle(.white)
//                   .rotation3DEffect(
//                       .degrees(-180 ),
//                        axis: (x: 0, y: 1, z: 0)
//                   )
//           }
//          
//               .rotation3DEffect(
//                   .degrees(show2 ? -180 : 0),
//                                         axis: (x: 0, y: 1, z: 0),
//                   anchor: .leading,
//                                         anchorZ: 0,
//                   perspective: 0.3
//               )
//           Image(.book).resizable().scaledToFill()
//               .frame(width: 220, height: 280)
//               .clipShape(.rect(cornerRadius: 12))
//               .rotation3DEffect(
//                   .degrees(show ? -90 : 0),
//                      axis: (x: 0, y: 1, z: 0),
//                      anchor: .leading,
//                      anchorZ: 0,
//                   perspective: 0.3
//               )
//     
//       }
//       .offset(x: 40)
//      
//       .onTapGesture {
//           withAnimation(.linear(duration: 1)) {
//               show.toggle()
//           }
//           withAnimation(.linear(duration: 1.995) ) {
//               show2.toggle()
//           }
//       }
//       .padding()
//   }
//}
//
//#Preview {
//   ContentView()
//}




//
//
//open
//
//import SwiftUI
//
//struct ContentView: View {
//   @State var show = false
//   @State var show2 = false
//    @State var move = false
//   var body: some View {
//       ZStack {
//         
//           UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous)
//               .frame(width: 150, height: 220)
//               .foregroundStyle(.blue.gradient)
//           ZStack{
//              
//               UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous)
//                   .frame(width: 150, height: 220)
//                   .foregroundStyle(.black.gradient)
//               Group{
//                   VStack(spacing:26){
//                       Text("SWIFTUI").font(.title.bold())
//                       VStack{
//                           Text("450").font(.largeTitle)
//                           Text("pages")
//                       }
//                   }
//               }
//                   .foregroundStyle(.white)
//                   .rotation3DEffect(
//                       .degrees(-180 ),
//                        axis: (x: 0, y: 1, z: 0)
//                   )
//           }
//          
//               .rotation3DEffect(
//                   .degrees(show2 ? -180 : 0),
//                                         axis: (x: 0, y: 1, z: 0),
//                   anchor: .leading,
//                                         anchorZ: 0,
//                   perspective: 0.3
//               )
//           Image(.book).resizable().scaledToFill()
//               .frame(width: 150, height: 220)
//               .clipShape(  UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 16, topTrailingRadius: 16, style: .continuous))
//               .rotation3DEffect(
//                   .degrees(show ? -90 : 0),
//                      axis: (x: 0, y: 1, z: 0),
//                      anchor: .leading,
//                      anchorZ: 0,
//                   perspective: 0.3
//               )
//     
//       }
//       .offset(x:move ?  74 : 0)
//       .onTapGesture {
//           withAnimation(.linear(duration: 1)) {
//               show.toggle()
//           }
//           withAnimation(.linear(duration: 1.995) ) {
//               show2.toggle()
//           }
//           
//           withAnimation(.linear(duration: 1).delay(1) ) {
//               move.toggle()
//           }
//       }
//       .padding()
//   }
//}
//
//#Preview {
//   ContentView()
//}
