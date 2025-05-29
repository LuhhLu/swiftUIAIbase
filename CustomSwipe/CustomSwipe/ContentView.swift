 

import SwiftUI
struct ContentView: View {
    @State var Xoffset = 0.0
@State var mark = false
    var body: some View {
        ZStack{
            Color("BG")
            ZStack{
                RoundedRectangle(cornerRadius: 15 - Xoffset/8).frame(height: 90 + Xoffset/10)
                    .foregroundColor(.white)
                HStack{
                    Image(systemName:mark ? "bookmark.fill" :  "hand.draw.fill").font(.title2)
                        .foregroundColor(mark ? .red : .blue)
                        .rotationEffect( .degrees(mark ? 0 : 70))
                        .offset(y: mark ? -34 : -18)
                    Text("Dynamic swipe action and menu with animation and more").bold()
                        .foregroundColor(.black)
                        .frame(width: 220,height: 70)
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .overlay(alignment: .bottomTrailing) {
                    ZStack{
                        HStack(spacing: -25 - Xoffset/2){
                            Button {
                                //
                            } label: {
                                Image(systemName: "folder.fill").font(.title)
                                    .scaleEffect(max(0 + Xoffset/80,-1))
                            }
                            Button {
                                withAnimation {
                                 Xoffset = 0
                                    mark.toggle()
                                }
                      
                            } label: {
                                Image(systemName: "bookmark.fill").font(.title)
                                    .scaleEffect(max(0 + Xoffset/80,-1))
                                    .foregroundColor(.red)
                            }
                            
                            Button {
                                //
                            } label: {
                                Image(systemName: "star.fill").font(.title)
                                    .scaleEffect(max(0 + Xoffset/80,-1))
                                    .foregroundColor(.yellow)
                            }
                            
                            
                        }
                        
                        
                        if Xoffset == 0 {
                            Menu {
                                Button {
                                    //
                                } label: {
                                    Label("Delet", systemImage: "trash")
                                }
                                Button {
                                    //
                                } label: {
                                    Label("Edit", systemImage: "pencil.and.outline")
                                }
                                Button {
                                    //
                                } label: {
                                    Label("Dane", systemImage: "checkmark.seal.fill")
                                    
                                }

                            } label: {
                                Image(systemName: "ellipsis").font(.system(size: 26))
                            }
                            .foregroundColor(.black)
                        }else{
                            HStack(spacing: 8 - Xoffset/4.3){
                                ForEach(0 ..< 3) { item in
                                    Circle().frame(width: 5.5, height: 5.5)
                                        .opacity( 1 + Xoffset/40)
                                        .blur(radius: 0 - Xoffset/10)
                                }
                            }
                           
                            
                            
                        }
                       

                    }
                    .rotationEffect(.degrees(180))
                    .padding(.trailing,5)
                }
                
            }
            .padding(.horizontal)
            .offset(x: Xoffset)
            .gesture(DragGesture()
                .onChanged({ value in
                    oncheange(value: value, xoffse: Xoffset)
                })
                    .onEnded({ value in
                        onEnd(value: value, xoffse: Xoffset)
                    })
            )
        }
        .ignoresSafeArea()
    }
    
  
    func oncheange(value:DragGesture.Value,xoffse:CGFloat){
        if value .translation.width < 0 {
            Xoffset = max(value.translation.width, -80)
            
        }
    }
    func onEnd(value:DragGesture.Value,xoffse:CGFloat){
        withAnimation {
            if  -value.translation.width >= 60{
                Xoffset = -50
            }else{
                Xoffset = 0
            }
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
