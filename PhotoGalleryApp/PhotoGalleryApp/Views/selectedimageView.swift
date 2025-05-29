 

import SwiftUI

struct selectedimageView: View {
    var selectedData :datamode
    var body: some View {
        VStack(spacing: 5){
            Image(selectedData.name)
                .resizable().scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width)
                .frame(height: 300)
                .clipped()
            VStack(alignment: .leading, spacing: 7){
                HStack(alignment: .bottom){
                    Text("name").bold()
                        .font(.largeTitle)
                    Spacer()
                    Button {
                        //
                    } label: {
                        HStack(spacing: 15){
                            Image(systemName: "arrow.down.circle")
                                .font(.title2)
                            Text("Douwnlod")
                                .font(.title3)
                        }
                            .foregroundColor(.white)
                            .frame(width: 165, height: 45)
                            .background(.black)
                            .cornerRadius(10)
                           
                    }
                }
                Text(selectedData.titel)
                    .font(.headline)
                    .frame(height: 130)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .padding(10)
                    .background(.white).cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                
            }
            .padding(.horizontal)
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct selectedimageView_Previews: PreviewProvider {
    static var previews: some View {
        selectedimageView(selectedData: datamode(name: "m1", titel: "SwiftUI provides developers"))
    }
}
