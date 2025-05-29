 
import SwiftUI
struct DynamicTextModel: Identifiable {
    let id = UUID()
    var text: String
    var color: Color
    var textHeight: CGFloat = 38
}
struct ContentView: View {
    @State var showDeleteAction: Bool = false
    @State private var selectedSquare: DynamicTextModel?
    @State private var dynamicTexts: [DynamicTextModel] = []
     var body: some View {
         ZStack{
             ScrollView{
                 HStack{
                     //Left VStack For Even Number
                     VStack(spacing:5){
                         ForEach($dynamicTexts.indices,id:\.self) { index in
                             if index % 2 == 0 {
                                 DynamicTextE(multiLineText: $dynamicTexts[index].text, textHeight: $dynamicTexts[index].textHeight, color: $dynamicTexts[index].color)
                                     .contextMenu(ContextMenu(menuItems: {
                                       menuButtons(textItem: dynamicTexts[index])
                                     }))
                             }
                          
                         }
                         Spacer()
                     }
                      //Right VStack For Odd Number
                     VStack(spacing:5){
                         ForEach($dynamicTexts.indices,id:\.self) { index in
                             if index % 2 != 0 {
                                 DynamicTextE(multiLineText: $dynamicTexts[index].text, textHeight: $dynamicTexts[index].textHeight, color: $dynamicTexts[index].color)
                                     .contextMenu(ContextMenu(menuItems: {
                                       menuButtons(textItem: dynamicTexts[index])
                                     }))
                                 
                             }
                          
                         }
                         Spacer()
                     }
                 }
                 .padding(.horizontal,8)
                 .animation(.spring, value: showDeleteAction)
                 
                
                 
             }
             Button {
                 addDynamicText()
             } label: {
                 Image(systemName: "plus").font(.title2)
                     
             }
             .tint(.white)
             .padding()
             .background(.black,in:Circle())
             .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
             .padding()
             .alert("are you sure", isPresented: $showDeleteAction, presenting: selectedSquare) { item in
                 Button("Delete",role: .destructive) {
                     DeleteItem(item)
                 }
                 Button("Cancel", role: .cancel) {}
             }message: { item in
                 Text("This action cannot be undone!")
             }
            
             
             

         }
        
    }
    func addDynamicText() {
    let newdynamictext = DynamicTextModel(text: "new text", color: randomColor())
        dynamicTexts.append(newdynamictext)
   }
    func randomColor() -> Color {
       Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
   }
    func menuButtons(textItem:DynamicTextModel) -> some View {
        Button {
            selectedSquare = textItem
            showDeleteAction.toggle()
        } label: {
            buttonsBody(buttonTitle: "Delete", imageName: "trash.circle")
        }

    }
    
    @ViewBuilder
    func buttonsBody(buttonTitle: String,imageName: String)->some View {
        HStack {
            Text(buttonTitle)
            Image(systemName: imageName)
        }
    }
    
    func DeleteItem(_ item: DynamicTextModel) {
        // Dispatch the array modification to the main queue to ensure it's executed in a safe and controlled manner.
        // This can help mitigate issues where the array might be modified while being iterated over or accessed in the SwiftUI view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dynamicTexts.removeAll { $0.id == item.id }
        }
    }

    
    
  
}

#Preview {
    ContentView()
}
