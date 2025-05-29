//
//  todoui.swift
//  custom sheet
//
//  Created by youssef on 2023-01-02.
//

import SwiftUI

struct todoui: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 5){
                todos(text: "learn swiftui sheet", color: .red)
                todos(text: "what new in swiftui??", color: .blue)
                todos(text: "what new in swiftui??", color: .purple)
            }
           
            .padding()
            
        }
        
    }
}

struct todoui_Previews: PreviewProvider {
    static var previews: some View {
        todoui()
    }
}

struct todos: View {
    var text = ""
    var color : Color
    var body: some View {
        ZStack{
            Color(.black)
            HStack{
                Image(systemName: "circlebadge")
                    .font(.system(size: 35,weight: .thin))
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
                Text(text).bold()
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
                Rectangle()
                    .frame(width: 5, height: 40)
                    .cornerRadius(5)
                    .foregroundColor(color)
            }
            
        }
        .frame(width: 350, height: 60)
        .cornerRadius(10)
    }
}
