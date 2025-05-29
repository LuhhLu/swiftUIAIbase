 

import SwiftUI
enum TabBarViews{
    case home,list,add,notif,search
}

struct TabBar: View {
    @Binding var selectedTab: TabBarViews
    @Environment(\.colorScheme) var isDark
    var body: some View {
        HStack(spacing: 45) {
                  Button(action: { selectedTab = .home }) {
                      Image(systemName: "house")
                          .foregroundColor(selectedTab == .home ? .primary : .gray)
                  }
                  Button(action: { selectedTab = .list }) {
                      Image(systemName: "list.bullet.rectangle.portrait")
                          .foregroundColor(selectedTab == .list ? .primary : .gray) //
                  }
                  Spacer()
                  Button(action: { selectedTab = .notif }) {
                      Image(systemName: "bell")
                          .foregroundColor(selectedTab == .notif ? .primary : .gray)
                  }
    
                  Button(action: { selectedTab = .search }) {
                      Image(systemName: "magnifyingglass")
                          .foregroundColor(selectedTab == .search ? .primary : .gray)
                  }
              }
        .font(.title2)
        .padding(.horizontal, 35)
        .overlay {
            Button(action: {
                selectedTab = .add
            }) {
                Image(systemName: "plus").foregroundStyle(.white)
                    .padding(20)
                    .background(isDark == .dark ? Color.gray.opacity(0.5) :  .black, in: Circle())
            }
            .offset(y: -40)
            .bold()
            .font(.title2)
        }
    }
}

#Preview {
    TabBar(selectedTab: .constant(.home))
}
