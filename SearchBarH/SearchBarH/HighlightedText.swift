





import SwiftUI

struct HighlightedText: View {
    var text:String
    var searchText:String
    var body: some View {
        let textArray = text.map{String($0)}
        let searchArray = searchText.map{String($0)}
        let highlighted:[Bool] = textArray.map{elemnt in
            searchArray.contains { searchElement in
                elemnt.caseInsensitiveCompare(searchElement) == .orderedSame
            }
        }
        return HStack{
            ForEach(0 ..< textArray.count,id: \.self) { index in
                Text(textArray[index])
                    .foregroundColor(highlighted[index] ? .red : .primary)
            }
        }
    }
}

//struct HighlightedText_Previews: PreviewProvider {
//    static var previews: some View {
//        HighlightedText()
//    }
//}
