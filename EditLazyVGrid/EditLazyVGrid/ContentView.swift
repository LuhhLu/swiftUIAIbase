 

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var showDeleteAction: Bool = false
    @State private var selectedSquare: Squares?
    @State private var showAddItemPopover: Bool = false
    @State private var newItemText: String = ""
    @State private var editingSquare: Squares?
    var body: some View {
        ZStack{
            Color.BG.ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing:10, content: {
                    ForEach(squaresData) { item in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(height: 200)
                                .foregroundStyle(.it)
                            Text(item.text).bold().font(.title2)
                        }
                        .contextMenu(ContextMenu(menuItems: {
                            menuButtons(square: item)
                        }))
                       
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        Image(systemName: "plus.circle").foregroundStyle(.white)
                            .font(.system(size: 60))
                            .onTapGesture {
                                showAddItemPopover = true
                            }
                    }
                    .animation(.easeIn, value: showDeleteAction)
                    .animation(.easeIn, value:  showAddItemPopover)
                    .foregroundColor(.it)
                    
                })
            }
            .padding(.horizontal,8)
        }
        .alert("Are tou sure", isPresented: $showDeleteAction, presenting: selectedSquare) { item in
            Button("Delete", role: .destructive) {
                DeleteItem(item)
            }
            Button("Cancel", role: .cancel) {}
        }message: { item in
            Text("This action cannot be undone!")
        }
        .alert(editingSquare == nil ? "Add new Item" : "update Text", isPresented: $showAddItemPopover) {
            TextField("New Itwm", text: $newItemText).foregroundStyle(.white)
            Button(editingSquare == nil ? "add" : "update", action: addandEditItem)
                
            Button("Cancel", role: .cancel) {}
              
        } message: {
            Text("Enter the text for the new item.")
        }
       

           
    }
    
    func DeleteItem (_ item:Squares){
        squaresData.removeAll{$0.id == item.id}
    }
    func addandEditItem(){
        if let EditingItem = editingSquare {
            if let index = squaresData.firstIndex(where: {$0.id == EditingItem.id}){
                withAnimation {
                    squaresData[index].text = newItemText
                }
            }
            editingSquare = nil
        }else{
            let newItem = Squares(text: newItemText)
            withAnimation {
                squaresData.append(newItem)
            }
            
        }
        newItemText = ""
        showAddItemPopover = false
        
    }
    @ViewBuilder
    func menuButtons(square: Squares)->some View {
        Button {
            withAnimation {
                editingSquare = square
                newItemText = square.text
                showAddItemPopover = true
            }
        } label: {
            buttonsBody(buttonTitle: "Edit", imageName: "slider.horizontal.2.gobackward")
        }
        Button {
            withAnimation {
                selectedSquare = square
                showDeleteAction.toggle()
            }
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

}

#Preview {
    ContentView()
}

struct Squares: Identifiable, Hashable {
    var id = UUID()
    var text:String
    
}

var squaresData: [Squares] = [
    Squares( text: "One"),
    Squares( text: "Two"),
    Squares( text: "Three"),
    Squares( text: "Four"),
]



