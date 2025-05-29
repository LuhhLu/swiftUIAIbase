



import SwiftUI


struct SearchBar: View {
    @Binding var text:String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(.systemGray6))
            .frame(height: 50)
            .overlay {
                HStack(spacing: 10){
                    if text.isEmpty{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    }
                    TextField("Search...", text: $text)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal,25)
            }
            .padding(.horizontal,10)
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
