 

import SwiftUI

struct CSelectionTow: View {
    let availableColors: [Color] = [.gray, .yellow, .pink, .red]
    @State private var selectedColor: Color = .gray
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Color").bold()
            HStack(spacing:16){
                ForEach(availableColors,id:\.self) { color in
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(color)
                       
                        .overlay(alignment: .topTrailing, content: {
                            ZStack {
                                Circle().frame(width: 13, height: 13).foregroundStyle(selectedColor == color ? Color.primary : .clear)
                                Image(systemName: "checkmark").font(.system(size: 8)).bold()
                                    .foregroundStyle(selectedColor == color ? .LD : .clear)
                                
                            }
                            
                            .overlay {
                                Circle().stroke(lineWidth: 1.2)
                                    .foregroundStyle(selectedColor == color ? .LD : .clear)
                            }
                        })
                    
                    
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color
                            }
                        }
                }
            }
   
        }
        .padding()
    }
}

#Preview {
    CSelectionTow()
}
