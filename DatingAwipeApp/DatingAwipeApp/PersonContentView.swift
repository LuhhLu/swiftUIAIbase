 
import SwiftUI

struct PersonContentView: View {
    let person: Person
    let size: CGSize
    
    var body: some View {
            VStack(spacing: 8) {
                ZStack{
                    person.image.resizable().scaledToFill()
                    VStack{
                        Spacer()
                        VStack(alignment: .leading, spacing: 4) {
                            Text(person.name + "\(person.age)")
                                .foregroundStyle(.white)
                                .font(.title.bold())
                            
                            Text(person.description)
                        }
                        .offset(x: -10)
                        HStack(alignment:.bottom, spacing:34){
                            Image(systemName: "xmark").font(.system(size: 15))
                                .frame(width: 50, height: 50)
                                .background(.thinMaterial,in: .circle)
                                .foregroundStyle(.white)
                            Image(systemName: "flame.fill").font(.title2)
                                .foregroundStyle(.black)
                                .frame(width: 60, height: 60)
                                .background(.white,in: .circle)
                            Image(systemName: "message.fill").font(.system(size: 15))
                                .frame(width: 50, height: 50)
                                .background(.thinMaterial,in: .circle)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom)
                    }
                    .frame(width: size.width)
                    
                }
                .frame(width: size.width, height: size.height)
                VStack(alignment: .leading, spacing: 8) {
                    Text("My bio")
                    Text(person.description).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                Image("Woman-1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width)
                Image("Woman-2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width)
            }
            .frame(maxWidth: .infinity)
        
       
    }
}

#Preview {
    GeometryReader {  geometry in
        PersonContentView(person:  Person(name: "Melisa", age: 36, description: "Lorem ispum dolor sit amet, consectetur adipiscing elit."), size:  geometry.size)
    }
  
}
