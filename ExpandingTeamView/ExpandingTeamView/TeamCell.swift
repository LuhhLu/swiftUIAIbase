 

import SwiftUI

struct TeamCell: View {
    @State var show = false
    @State var show2 = false
    let teams:[Teams]
    @Namespace var namespace
    var body: some View {
        VStack{
            if show{
                VStack(alignment: .leading) {
                    ForEach(teams) { team in
                        HStack{
                            Text(team.title).font(.title2.bold())
                                .foregroundStyle(.secondary)
                                .matchedGeometryEffect(id:team.title, in: namespace)
                            Spacer()
                            if show2{
                                Button {
                                    show2 = false
                                    withAnimation(.spring) {
                                        show.toggle()
                                    }
                                } label: {
                                    ZStack{
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundStyle(.white)
                                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
                                        Image(systemName: "xmark")
                                            .foregroundStyle(.black)
                                    }
                                }
                                .transition(.scale)
                                

                            }
                        }
                        ForEach(team.members) { person in
                            HStack{
                                Image(person.image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 35, height: 35)
                                    .matchedGeometryEffect(id: person.image, in: namespace)
                                if show2{
                                    VStack(alignment: .leading) {
                                        Text(person.name).bold()
                                        Text(person.jobTitle)
                                            .font(.footnote)
                                            .foregroundStyle(.secondary)
                                    }
                                    .transition(.scale(scale: 0, anchor: .leading))
                                    .animation(.none, value: show)
                                }
                            }
                        }
                    }
                }
                .padding(10)
                
                
                
                
            }else{
                ForEach(teams) { team in
                    VStack{
                        HStack(alignment: .top) {
                            VStack{
                                ForEach([0,1],id:\.self) { index in
                                    if index < team.members.count{
                                        Image(team.members[index].image).resizable().scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 35, height: 35)
                                            .matchedGeometryEffect(id: team.members[index].image, in: namespace)
                                        
                                    }
                                }
                            }
                            VStack{
                                let maxCount = min(team.members.count, 4)
                                ForEach(2..<maxCount,id:\.self) { index in
                                    if index < team.members.count{
                                        Image(team.members[index].image).resizable().scaledToFill()
                                            .clipShape(Circle())
                                            .frame(width: 35, height: 35)
                                            .matchedGeometryEffect(id: team.members[index].image, in: namespace)
                                        
                                    }
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(team.title)
                                    .font(.title2.bold())
                                    .matchedGeometryEffect(id: team.title, in: namespace)
                                Text("\(team.members.count) members")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.leading,12)
                            Spacer()
                            
                        }
                        .overlay(alignment: .trailing) {
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(10)
                }
              
                
            }
        }
        .clipped()
        .background(.gray.opacity(0.3),in:.rect(cornerRadius:18))
        .contentShape(Rectangle())
        .onTapGesture {
            if !show{
                withAnimation(.spring) {
                    show.toggle()
                }
                withAnimation(.spring.delay(0.3)) {
                    show2 = true
                }
            }
        }
        .padding(10)
    }
}

//#Preview {
//    TeamCell()
//}
