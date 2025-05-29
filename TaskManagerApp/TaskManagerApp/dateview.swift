import SwiftUI
struct dateview: View {
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var  corenDate: Date = Date()
    @State var  Quicknote = ""
    @State var  editing = false
    @Binding var  edit : Bool
    @State var save = false
    @AppStorage("note") var note: String?
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading){
                Text(corenDate.formatted(.dateTime.hour(.defaultDigits(amPM: .omitted)).minute()))
                Text(corenDate.formatted(.dateTime.weekday()))
            }
            .font(.system(size: 50, weight: .medium, design: .default))
            Rectangle()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("note"))
                .overlay(alignment: .top, content: {
                    Rectangle()
                        .frame(height: 20)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.yellow)
                })
                .cornerRadius(10)
                .overlay(alignment: .center, content: {
                    if editing{
                        TextField("new Note", text: $Quicknote)
                            .foregroundColor(.white)
                            .frame(height: 30)
                            .background(Color.gray.opacity(0.2).cornerRadius(5))
                            .offset(y:5)
                    }else{
                        Text(note ?? "no datat").bold()
                            .minimumScaleFactor(0.6)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .padding(.horizontal,10)
                    }
                    
                })
                .overlay(alignment: .bottomTrailing, content: {
                    if edit{
                        Button(action: {
                            editing.toggle()
                            save.toggle()
                            edit.toggle()
                            if !Quicknote.isEmpty{
                                note = Quicknote
                                Quicknote = ""
                            }
                           
                        }, label: {
                            Image(systemName: "pencil").bold()
                                .font(.title2)
                                .foregroundColor(.yellow)
                        })
                        .padding(7)
                    }
                    if save{
                        Button(action: {
                            if !Quicknote.isEmpty{
                                note = Quicknote
                                Quicknote = ""
                            }
                            editing.toggle()
                            save.toggle()
                        }, label: {
                            Image(systemName: "checkmark").bold()
                                .foregroundColor(.blue)
                            
                        })
                        .padding(7)
                    }
                })
                
        }
        .onReceive(timer, perform: { value in
            corenDate = value
            
        })
    }
}

struct dateview_Previews: PreviewProvider {
    static var previews: some View {
        dateview(edit: .constant(false))
    }
}
