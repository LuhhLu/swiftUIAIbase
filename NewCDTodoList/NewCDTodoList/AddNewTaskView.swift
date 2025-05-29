

import SwiftUI


struct AddNewTaskView: View {
    let icons:[String] = ["folder.fill","paperplane.fill","books.vertical.fill","backpack.fill","figure.badminton","trophy.fill","power.dotted","delete.backward.fill","zzz","cloud.drizzle.fill","star.square.on.square.fill","phone.circle.fill","house","video.and.waveform","questionmark.folder","wrench.and.screwdriver","tshirt.fill","alarm","pill.circle","gamecontroller.fill","xboxlogo","airplane.departure","tram.fill","bicycle","cart.fill.badge.questionmark"]
    @State var inputText = ""
    @Binding var isPresented:Bool
    @State var iconSelcted = "folder.fill"
    var columns :[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
      RoundedRectangle(cornerRadius: 20)
            .frame(height: 310)
            .foregroundColor(.white)
            .overlay(content: {
                VStack(spacing: 10){
                    HStack{
                        Button(action: {
                            isPresented = false
                        }, label: {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundColor(.black)
                            
                        })
                        Spacer()
                        Button(action: {
                            do{
                                try CDTaskService.saveMyTask(inputText, iconSelcted)
                                isPresented = false
                            }catch{
                            fatalError("\(error)")
                            }
                        }, label: {
                            Text("save").bold()
                                .foregroundColor(.black)
                        })
                        .buttonStyle(.bordered)
                    }
                    .padding(.top)
                    HStack(spacing: 10){
                        Image(systemName: iconSelcted)
                            .imageScale(.large)
                            .foregroundColor(.black)
                            .frame(width: 35, height: 40)
                        TextField("Task titel...", text: $inputText)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        
                    }
                    ScrollView(.vertical,showsIndicators: false){
                        LazyVGrid(columns: columns, content: {
                            ForEach(icons,id: \.self) { icon in
                                ZStack{
                                    Image(systemName: icon)
                                        .imageScale(.medium)
                                        .foregroundColor(.black)
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(iconSelcted == icon ? .black : .clear)
                                }
                                .onTapGesture {
                                    iconSelcted = icon
                                }
                               
                                
                            }
                            .padding(.top,5)
                        })
                    }
                    .background(.black.opacity(0.1))
                    .cornerRadius(10)
                    Spacer()
                }
                .padding(.horizontal)
            })
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
        
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView(isPresented: .constant(false))
    }
}
