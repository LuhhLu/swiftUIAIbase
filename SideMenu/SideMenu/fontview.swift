//
//  fontview.swift
//  SideMenu
//
//  Created by youssef on 2023-06-13.
//

import SwiftUI

struct fontview: View {
    var body: some View {
        VStack{
           
            Text("Hello, World!").font(.custom("Zapfino", size: 28))
            Text("Hello, World!").font(.custom("Copperplate", size: 25))
            Text("Hello, World!").font(.custom("Didot", size: 28))
            Text("Hello, World!").font(.custom("Hoefler Text", size: 24))
            Text("Hello, World!").font(.custom("Papyrus", size: 18))
            Text("Hello, World!").font(.custom("Bradley Hand", size: 22))
           
            

         
        }
    }
}

struct fontview_Previews: PreviewProvider {
    static var previews: some View {
        fontview()
    }
}
