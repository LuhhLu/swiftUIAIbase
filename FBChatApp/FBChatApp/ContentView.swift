 
import SwiftUI
import FirebaseDatabase
struct ChatMessage{
    let text:String
    let userId:String
}
struct ContentView: View {
    @State var  messageText = ""
    @State var  userId = UserDefaults.standard.string(forKey: "userId") ?? UUID().uuidString
    @State var textHeigt:CGFloat = 38
    @State var  message = [ChatMessage]()
    
    var body: some View {
        VStack {
            ScrollView(.vertical,showsIndicators: false){
                ForEach(message,id: \.text) { message in
                    HStack {
                        if message.userId == self.userId{
                            Spacer()
                            Text(message.text)
                                .font(.title3)
                                .padding(5)
                                .background(Color("chat"))
                                .foregroundColor(.black)
                                .cornerRadius(7)
                        }else{
                            Text(message.text)
                                .font(.title3)
                                .padding(5)
                                .background(.gray.opacity(0.3))
                                .foregroundColor(.black)
                                .cornerRadius(7)
                            Spacer()
                        }
                    }
                    
                }
            }
            HStack{
                MultiLineT(multiLineText: $messageText, textHeight: $textHeigt)
                Button {
                   sendMessage()
                    textHeigt = 38
                } label: {
                    Image(systemName: "paperplane.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }

            }
        }
        .onAppear(perform: loadMessages)
        .padding()
        
    }
    func sendMessage(){
        guard !messageText.isEmpty else {return}
        let dbRef = Database.database().reference()
        let messageRef = dbRef.child("messages").childByAutoId()
        let messageData = ["text": messageText,"userId": userId,]
        messageRef.setValue(messageData)
        messageText = ""
    }
    func loadMessages(){
        let dbRef = Database.database().reference()
        dbRef.child("messages").observe(.childAdded){ snapshot in
            if let data = snapshot.value as? [String: Any],
               let text = data["text"] as? String,
               let userId = data["userId"] as? String{
                self.message.append(ChatMessage(text: text, userId: userId))
            }
            
        }
    }
    init(){
        if UserDefaults.standard.string(forKey: "userId") == nil{
            UserDefaults.standard.set(userId, forKey: "userId")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
