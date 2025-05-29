

import SwiftUI

struct imagegrid: View {
    @ObservedObject var  imageSelection = ImageSelection()
    var columns:[GridItem] = [GridItem(.flexible())]
    var body: some View {
        ScrollView{
            HStack(spacing: 0){
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(theimages,id: \.id) { item in
                        Button {
                            imageSelection.selectedData = item
                            imageSelection.showingSheet = true
                        } label: {
                            Image(item.name)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: imageSelection.getHeight(theimages.firstIndex(of: item) ?? 0))
                                .cornerRadius(20)
                                .padding(.vertical,2)
                        }
                    }
                }
                LazyVGrid(columns: columns,spacing: 0) {
                    ForEach(theimages2,id: \.id) { item in
                        Button {
                            imageSelection.selectedData = item
                            imageSelection.showingSheet = true
                        } label: {
                            Image(item.name)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: imageSelection.getHeight2(theimages2.firstIndex(of: item) ?? 0))
                                .cornerRadius(20)
                                .padding(.vertical,2)
                        }
                    }
                    
                }
            }
        }
        .padding(.horizontal,10)
        .sheet(isPresented: $imageSelection.showingSheet) {
            selectedimageView(selectedData: imageSelection.selectedData ?? theimages[0])
                .presentationDetents([.fraction(0.64),.large])
                .presentationDragIndicator(.visible)
        }
        
    }
}

struct iamgesGrid_Previews: PreviewProvider {
    static var previews: some View {
        imagegrid()
    }
}
