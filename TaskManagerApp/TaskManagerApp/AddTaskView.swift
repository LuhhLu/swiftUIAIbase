

import SwiftUI


struct AddTaskView: View {
    @EnvironmentObject var vm : TaskManagerViewModel
    @Environment(\.self) var Envi
    let colors :[String] = ["Yellow","green","red","red 1","red 2","red 3","red 4","red 5","red 6"]

    let icons :[String] = ["swift","ic1", "ic2", "ic3" ,"ic4", "ic5" ,"ic6","ic7","ic9","ic8","ic10","ic11"]
    var body: some View {
        VStack{
            Text("New Task")
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading, content: {
                    Button(action: {Envi.dismiss()}, label: {
                        Image(systemName: "arrow.backward").bold()
                            .foregroundColor(.red)
                        
                    })
                })
            VStack(alignment: .leading, spacing: 10){
                BarColor(section: "Colors", colors: colors, vm: _vm)
                theicon(section: "Icons", icons: icons, vm: _vm)
                Divider()
                HStack{
                    Text(vm.taskDeadline.formatted(date: .abbreviated, time: .omitted) + "," + vm.taskDeadline.formatted(date: .omitted, time: .shortened))
                    Spacer()
                    Button(action: {vm.showDataPicker.toggle()}, label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                    })
                }
                Divider()
                textfilTitel(typeing: $vm.tasktitel, titel: "Titel")
                Divider()
                textfilTitel(typeing: $vm.taskdescrptiont, titel: "description")
                
            }
            .padding(.vertical,30)
            
        }
        .frame(maxHeight:.infinity,alignment: .top)
        .padding()
        .overlay{
            ZStack{
                if vm.showDataPicker{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            vm.showDataPicker = false
                        }
                    DatePicker("", selection: $vm.taskDeadline,in:Date.now...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white,in:RoundedRectangle(cornerRadius: 12,style: .continuous))
                        .padding()
                }
            }
        }
        .overlay(alignment: .bottom, content: {
            Button(action: {
                if !vm.tasktitel.isEmpty || !vm.taskdescrptiont.isEmpty{
                    if vm.addnewtask(context: Envi.managedObjectContext){
                        Envi.dismiss()
                    }
                }
            }, label: {
                Text("Save")
                    .foregroundColor(.white)
                    .padding(.vertical,12)
                    .padding(.horizontal)
                    .background(.black,in:Capsule())
            })
        })
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(TaskManagerViewModel())
    }
}
struct BarColor:View{
    var section = ""
    let colors:[String]
    @EnvironmentObject var vm :TaskManagerViewModel
    var body: some View{
        Text(section)
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(colors,id: \.self){color in
                 Circle()
                        .fill(Color(color))
                        .frame(width: 25, height: 25)
                        .background(content:{
                            if vm.taskColor == color{
                                Circle()
                                    .strokeBorder(.gray)
                                    .padding(-3)
                            }
                        })
                        .onTapGesture {
                            vm.taskColor = color
                        }
                }
            }
            .padding()
            
        }
        
    }
}

struct theicon:View{
    var section = ""
    let icons:[String]
    @EnvironmentObject var vm :TaskManagerViewModel
    var body: some View{
        Text(section)
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(icons,id: \.self){icon in
                 Image(icon)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .frame(width: 25, height: 25)
                        .background(content:{
                            if vm.taskIcon == icon{
                                Rectangle()
                                    .strokeBorder(.gray)
                                    .padding(-3)
                            }
                        })
                        .onTapGesture {
                            vm.taskIcon = icon
                        }
                }
            }
            .padding(10)
            
        }
        
    }
}
struct textfilTitel:View{
    @Binding var typeing:String
    var titel = ""
    var body: some View{
        TextField(titel, text: $typeing)
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(Color.gray.opacity(0.3).cornerRadius(5))
            .foregroundColor(.black)
        
    }
}
