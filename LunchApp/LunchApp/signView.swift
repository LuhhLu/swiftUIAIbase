 

import SwiftUI

struct signView: View {
    @State var show = false
    @State var text = ""
    @Binding var showSignView:Bool
    var body: some View {
        VStack{
            if !show{
                Spacer()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 40).foregroundStyle(.white)
                    .frame(maxWidth: .infinity,maxHeight: show ? .infinity : 400)
                    .padding(.horizontal , show ? 0 : 10)
                if !show {
                    VStack(spacing:20){
                        thetext
                        buttons
                    }
                    .padding(.horizontal,30)
                }
                if show {
                    VStack(alignment:.leading,spacing:20){
                        Button {
                            withAnimation {
                                show.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                
                        }
                        .padding().background(.ultraThinMaterial,in:Circle())
                        .frame(maxWidth: .infinity,alignment: .leading)
                      
                       
                    Text("Continue with email.").bold().font(.title)
                    Text("Set sail on your next adventure by simply entering your email. Let's discover the world together!")
                        TextField("Email address", text: $text)
                            .font(.title)
                            .frame(maxWidth: .infinity)
                        PassTF()
                        Spacer()
                        ButtonStyle(icon: "", title: "next") {
                            
                        }
                        .padding(.bottom,30)
                        
                        
                        
                    }
                    .foregroundStyle(.black)
                    .padding(.top,100)
                    .padding(.horizontal)
                    
                }
  
            }
            .clipped()
            
        }
    
        .offset(y: show ? 0 : -30)
        
    }
    var thetext:some View{
        VStack(alignment:.leading,spacing: 10){
            HStack{
                Text("Voyage").font(.largeTitle)
                Spacer()
                Button {
                    withAnimation {
                        showSignView.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                }
                .padding().background(.ultraThinMaterial,in:Circle())
                

            }
            .foregroundStyle(.black)
            Text("Get started").font(.title)
            Text("Embark on unforgettable journeys with Voyage").foregroundStyle(.secondary)
                .bold()
        }
    }
    var buttons:some View{
        VStack(spacing:10){
            ButtonStyle( icon: "email3", title: "Continue with Email") {
                withAnimation {
                    show.toggle()
                }
                
            }
            ButtonStyle( icon: "google", title: "Continue with Gmail") {}
            ButtonStyle( icon: "apple", title: "Continue with Apple") {}
           
        }
        
    }

}
#Preview {
    signView(showSignView: .constant(false))
}
