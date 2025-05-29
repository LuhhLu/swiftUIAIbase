import SwiftUI

struct orderCount : View {
    @State private var count: Int = 1
    var body: some View {
        HStack(spacing: 18) {
            CountButton(icon: "minus", BGcolor: .gray.opacity(0.2), action: {
                if count > 0 {
                    count -= 1
                }
              
           })
            Text("\(count)")
                .font(.system(size: 16).bold())
                .frame(width: 35)
                .foregroundStyle(.primary)
                .contentTransition(.numericText())
            
            
            CountButton(icon: "plus", BGcolor: .gray.opacity(0.2), action: {
                
                count += 1
            })
        }
        .padding(8)
        .background(.thinMaterial,in:.rect(cornerRadius: 20))
    }
}

#Preview {
    orderCount ()
}
struct CountButton: View {
    var icon:String
    var BGcolor:Color
    var action:() -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .font(.system(size: 15).bold())
                
                .frame(width: 30, height: 30)
                .background(BGcolor,in:.circle)
        }
        .tint(.primary)
        
     }
}

 
