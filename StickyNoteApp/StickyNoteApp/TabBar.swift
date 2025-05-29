 

import SwiftUI

struct TabBar: View {
    @Binding var selectTab:TabBarViews
    @Environment(\.colorScheme) var isdark
    @Binding var show :Bool
    var body: some View {
        HStack(spacing:45){
            Button(action: {
                selectTab = .home
                
            }, label: {
              Image(systemName: "house")
                    .foregroundColor( selectTab == .home ? .primary : .gray)
            })
            Button(action: {  selectTab = .list }) {
                Image(systemName: "list.bullet.rectangle.portrait")
                    .foregroundColor( selectTab == .list ? .primary : .gray)
            }
        
            
            Spacer()
            
            
            Button(action: {  selectTab = .notif }) {
                Image(systemName: "bell")
                    .foregroundColor( selectTab == .notif ? .primary : .gray)
            }

            Button(action: {selectTab = .search }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor( selectTab == .search ? .primary : .gray)
            }
         
        }
        .font(.title3)
        .padding(.horizontal,35)
        .overlay {
            Button(action: {
                selectTab = .add
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    withAnimation {
                        show = true
                    }
                }
                
            }, label: {
              Image(systemName: "plus")
                    .padding(20)
                    .background(isdark == .dark ? Color.gray :.black,in:Circle())
                    .foregroundColor(  .white)
            })
            .offset(y: -40)
            .font(.title2)
            .bold()
        }
    }
}

#Preview {
    TabBar(selectTab: .constant(.home), show: .constant(false))
}
