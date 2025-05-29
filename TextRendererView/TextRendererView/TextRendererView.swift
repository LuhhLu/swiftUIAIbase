



import SwiftUI
struct TextRendererView: View {
   @State var MoveFrom = false
   var body: some View {
             ZStack{
                 Text("Get started")
                     .font(.title.bold())
                     .foregroundStyle(.gray.opacity(0.1))
                 Text("Get started")
                 .font(.title.bold())
                 .textRenderer(DTTextRenderer(animationProgress: MoveFrom ? 3 : -1))
             }
             .frame(height: 55)
             .frame(maxWidth: .infinity)
             .background(.gray.tertiary,in:Capsule())
         
         .padding()
         .onAppear(){
             withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                 MoveFrom.toggle()
             }
         }
     }
}

#Preview {
   TextRendererView()
}

import SwiftUI
struct DTTextRenderer: TextRenderer {
   var animationProgress: CGFloat
   var animatableData: Double {
        get { animationProgress }
        set { animationProgress = newValue }
    }
   func draw(layout: Text.Layout, in ctx: inout GraphicsContext) {
       for line in layout {
           for runs in line {
               for (index, glyph) in runs.enumerated() {
                   let relativePosition = CGFloat(index) / CGFloat(runs.count)
                   let adjustedOpacity = max(0, 1 - abs(relativePosition - animationProgress))
                   ctx.opacity = Double(adjustedOpacity)
                   ctx.draw(glyph)
               }
           }
       }
   }
}
