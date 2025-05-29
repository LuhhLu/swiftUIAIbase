

import SwiftUI

struct ProgressView: View {
    var percentage:CGFloat = 100
    var progress:CGFloat = 200
    var width:CGFloat = 200
    var multiple:CGFloat = 200
    var name:String = "Work"
    var body: some View {
        let muliplaier = width / multiple
        VStack(alignment: .leading){
            HStack{
                Text(name).bold()
                    .font(.headline)
                Spacer()
                ZStack{
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                    Text("\(Int(percentage * muliplaier))%").bold()
                        .font(.system(size: 13))
                    
                }
            }
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 200, height: 8)
                    .foregroundColor(.black.opacity(0.1))
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: progress * muliplaier, height: 8)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
            }
        }
        .padding(5)
        .frame(width: 210, height: 80)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
