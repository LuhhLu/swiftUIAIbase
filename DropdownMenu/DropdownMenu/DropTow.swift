 

import SwiftUI

struct DropTow: View {
    @State var show = true
    @State var name = "Item1"
    var body: some View {
        VStack {
            ZStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                    ScrollView{
                        VStack(spacing: 17){
                            ForEach(drop.indices,id:\.self) { item in
                                if  item != 0 {
                                    Rectangle().frame(height: 1)
                                        .foregroundColor(.gray)
                                }
                                Button {
                                    withAnimation {
                                        name = drop[item].title
                                        show.toggle()
                                    }
                                } label: {
                                    Text(drop[item].title).foregroundColor(.black).font(.title2)
                                        .bold()
                                    Spacer()
                                }

                            }
                            .padding(.horizontal)
                            
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.vertical,15)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray)
                        .padding(1)
                }
                
                .frame(height: show ? 200 : 50)
                .offset(y:  show ? 0 : -135)
                .foregroundColor(.white)
             
                
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10).frame(height: 60)
                        .foregroundColor(.white)
                    HStack{
                        Text(name).font(.title2)
                        Spacer()
                        
                        Image(systemName: "triangle.fill")
                            .rotationEffect(.degrees(show ? 0 : 90))
                    }
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).frame(height: 60)
                        .padding(1)
                    
                }
                .offset(y: -133)
                .onTapGesture {
                    withAnimation {
                        show .toggle()
                    }
                }
            }
            
        }
        .padding()
        .frame(height: 280).offset(y: 40)
       
    }
}

struct DropTow_Previews: PreviewProvider {
    static var previews: some View {
        DropTow()
    }
}
