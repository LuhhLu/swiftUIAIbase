//
//  ContentView.swift
//  custom sheet
//
//  Created by youssef on 2023-01-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            HStack{
                VStack (alignment: .leading,spacing: 20){
                    Text("Today").bold()
                        .font(.title)
                        .padding(.vertical,20)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui sheetew ", color: .purple)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui", color: .red)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui", color: .orange)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui sheetew ", color: .purple)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui", color: .red)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui", color: .orange)
                    todaytasks(ftime: "4:00", ttime: "6:00", day: "manday", task: "learn swiftui", color: .orange)
                }
                Spacer()
            }
            .padding(.horizontal,30)
         
        }
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct todaytasks: View {
    var  ftime  = ""
    var ttime = ""
    var day = ""
    var task = ""
    var color: Color
    var body: some View {
        HStack(spacing: 20){
            VStack{
                Text(ftime)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Text(ttime)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            Rectangle()
                .frame(width: 5, height: 30)
                .cornerRadius(5)
                .foregroundColor(color)
            VStack(alignment: .leading){
                Text(day).bold()
                    .font(.headline)
                    .foregroundColor(.black)
                Text("swiftui sheet")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                
            }
        }
    }
}
