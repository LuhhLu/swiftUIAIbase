 

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            VStack(spacing:36) {
                  BookView()
                 
                  Text("Learn SwiftUI")
                      .font(.title)
                      .fontWeight(.bold)
                      .multilineTextAlignment(.center)
                      .padding(.horizontal)
                  HStack(spacing:16){
                      Spacer()
                      Image(systemName: "gift.fill")
                      Image(systemName: "ellipsis.circle.fill")
                  }
                  .font(.title)
                  Text("BUY  |  69,00 kr")
                      .font(.headline)
                      .frame( height: 55)
                      .frame(maxWidth: .infinity)
                      .background(.gray.opacity(0.3),in: Capsule())
                  HStack {
                      Button(action: {
                          // Action for "Want to Read"
                      }) {
                          Label("WANT TO READ", systemImage: "checkmark.circle.fill")
                              .font(.headline)
                              .foregroundColor(.primary)
                              .padding(.horizontal)
                              .frame( height: 55)
                              .fixedSize()
                              .overlay {
                                  RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 2)
                                      .foregroundStyle(.gray.opacity(0.3))
                              }
                          
                      }
                      Spacer()
                      
                      Button(action: {
                          // Action for "Excerpt"
                      }) {
                          Label("EXCERPT", systemImage: "doc.text.fill")
                              .font(.headline)
                              .foregroundColor(.primary)
                              .frame(maxWidth: .infinity)
                              .frame(height: 55)
                              .padding(.horizontal)
                              .fixedSize()
                              .overlay {
                                  RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 2)
                                      .foregroundStyle(.gray.opacity(0.3))
                              }
                      }
                  }

              }
            .padding(.horizontal,26)
        }
    
 
      }
  }

//#Preview {
//    HomeView()
//}
#Preview {
    TabViews()
}
