 
import SwiftUI
struct taskCard: View {
    @Environment(\.self) var Envi
    @EnvironmentObject var vm : TaskManagerViewModel
    var titel = ""
    var descriptiont = ""
    var iconename = ""
    var colorname = ""
    var dateDate = ""
    var dataTime = ""
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 160)
                .foregroundColor(Color("note"))
                .overlay(alignment: .leading, content: {
                    Rectangle()
                        .frame(width: 6, height: 130)
                        .foregroundColor(Color(colorname))
                        .cornerRadius(5)
                })
                .overlay(alignment: .top, content: {
                    VStack(spacing: 0){
                        HStack{
                            Text(titel)
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                            Spacer()
                            Image(iconename)
                                .resizable()
                                .scaledToFit()                                .frame(width: 25, height: 25)
                                .clipShape(Rectangle())
                        }
                        .padding(.horizontal,10)
                        Text(descriptiont)
                            .minimumScaleFactor(0.9)
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 85)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal,10)
                        
                    }
                    .padding(.vertical,5)
                })
                .overlay(alignment: .bottomLeading, content: {
                    HStack{
                        Image(systemName: "calendar")
                        Text(dateDate)
                        Image(systemName: "clock.arrow.circlepath")
                        Text(dataTime)
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    
                })
                .cornerRadius(10)
            
        }
    }
}

struct taskCard_Previews: PreviewProvider {
    static var previews: some View {
        taskCard()
            .environmentObject(TaskManagerViewModel())
    }
}
