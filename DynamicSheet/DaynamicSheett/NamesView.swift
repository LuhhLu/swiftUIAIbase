 
import SwiftUI
struct NamesView: View {
    @Binding var currentView: Int
    var id: Namespace.ID
    @State var  offset = false
    @State var  name = ""
    @State var  lastname = ""
    @FocusState var IsKeyboardOpen : Bool
    @Binding var keyboradshow :Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .matchedGeometryEffect(id: "shape", in: id)
                .frame(height: 230).foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
                .frame(maxHeight: .infinity,alignment: .bottom)
            VStack (spacing: 20){
                VStack(alignment: .leading, spacing: 20){
                    Spacer()
                    TextF(titel: "Name", text: $name, IsKeyboardOpen: _IsKeyboardOpen)
                    TextF(titel: "LastName", text: $lastname, IsKeyboardOpen: _IsKeyboardOpen)

                }
             
               ButtonS(text: "continue", currentView: $currentView, IsKeyboardopen: _IsKeyboardOpen)
            }
            .padding()
            .offset(y: offset ? 10 : 300)
            .onChange(of:IsKeyboardOpen){
                keyboradshow.toggle()
        }
                
        }
        //If a keyboard is opened, it is pushed into the middle of the screen
        .offset(y: keyboradshow ? -360 : 0)
        .animation(.easeInOut, value: keyboradshow)
        .onAppear{
            withAnimation(.spring) {
                offset.toggle()
            }
        }
        .ignoresSafeArea()
        
        
    }
}

//#Preview {
//    NamesView(currentView: .constant(0), keyboradshow: .constant(false))
//}
struct TextF: View {
    var titel = ""
       @Binding var text :String
       @FocusState var IsKeyboardOpen:Bool
    var body: some View {
        HStack{
            Text(titel).bold().font(.title2)
            Spacer()
            TextField("", text: $text).padding()
                .focused($IsKeyboardOpen)
                .frame(width: 150, height: 40)
                .background(.white,in:RoundedRectangle(cornerRadius: 5))
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
            
        }
    }
}

 
struct ButtonS: View {
    var text = ""
    @Binding var currentView: Int
    @FocusState var IsKeyboardopen : Bool
    var body: some View {
        Button(action: {
            if IsKeyboardopen{
                IsKeyboardopen = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if currentView != 3{
                    withAnimation {
                        currentView += 1
                    }
                }
                
            }
        }, label: {
            Text(text).bold().font(.title2).foregroundStyle(.white)
                .frame(width: 250, height: 50)
                .background(.black,in: RoundedRectangle(cornerRadius: 30))
                .padding(.bottom)
        })
        .overlay(alignment: .leading) {
            Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if currentView != 0 {
                        currentView -= 1
                    }
                }
               
            }, label: {
                Image(systemName: "arrow.left").bold().font(.title3).foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .background(.black,in:RoundedRectangle(cornerRadius: 30))
                    .padding(.bottom)
            })
        }
       
        
    }
}

 
