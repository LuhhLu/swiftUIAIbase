 
import SwiftUI
enum TabBarViews{
    case home,list,add,notif,search
}
struct HomeView: View {
    @State var selectTab = TabBarViews.home
    @State var show = false
    @State var vm = Model()
    var body: some View {
        ZStack{
            switch selectTab {
            case .home:
                TimeBoardView(vm: vm)
            case .list, .add:
               BorderView(vm: vm,show: $show)
            case .notif:
                Text("notif view")
            case .search:
                Text("search view")
            }
            TabBar(selectTab: $selectTab, show: $show)
                .frame(maxHeight: .infinity,alignment: .bottom)
        }
      
        
    }
}

#Preview {
    HomeView()
}
