
import SwiftUI
struct SideBar: View {
    @EnvironmentObject var vm : ViewModel
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            userAndDB()
                .padding()
            TabItemAndAnmation()
            Projects()
            Spacer()
            DarkToggle(vm: _vm)
            Spacer()
            
        }
        .frame(maxWidth: 288 ,maxHeight: .infinity)
        .background(Color("black"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity,alignment: .leading)
        
    }
    @ViewBuilder
    func userAndDB()-> some View{
        HStack{
            Image("person")
                .resizable()
                .scaledToFill()
                .mask(Circle())
                .frame(width: 60, height: 60)
            VStack{
                Text("name").bold()
                    .font(.title2)
                    .foregroundColor(.white)
                Text("@name").bold()
                    .font(.callout)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            Button(action: {
                withAnimation(.easeIn){
                    vm.isopen.toggle()
                    vm.sideButton.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            .padding(.vertical,30)
        }
    }
    @ViewBuilder
    func TabItemAndAnmation()-> some View{
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
                .foregroundColor(.white)
                .padding(.horizontal)
            ForEach(sidebar){ item in
               Button(action: {
                   withAnimation{
                       vm.selctetditem = item.tab
                   }
               }, label: {
                   HStack(spacing: 14){
                       Image(systemName: item.icon)
                           .font(.headline)
                       Text(item.titel)
                           .font(.title3)
                   }
                   .frame(maxWidth: .infinity,alignment: .leading)
                   .padding()
               })
               .foregroundStyle(vm.selctetditem == item.tab ? .white : .gray)
            }
            
        }
        .frame(width: 300, height: 240)
        .overlay(content: {
            VStack{
                if vm.selctetditem == .maginf{Spacer()}
                if vm.selctetditem == .rect{Spacer()}
                if vm.selctetditem == .bell{
                    Spacer()
                    Spacer()
                }
                Rectangle()
                    .frame(width: 3, height: 25)
                    .foregroundStyle(.green)
                    .cornerRadius(2)
                    .padding(.vertical,8)
                    .padding(.horizontal,5)
                if vm.selctetditem == .home{Spacer()}
                if vm.selctetditem ==  .maginf{
                    Spacer()
                    Spacer()
                }
                if vm.selctetditem == .bell {Spacer()}
            }
            .frame(height: 210)
            .frame(maxWidth: .infinity,alignment: .leading)
        })
        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
            .environmentObject(ViewModel())
    }
}

struct DarkToggle : View{
    @EnvironmentObject var vm:ViewModel
    var body: some View{
        HStack{
            Image(systemName: "gearshape")
            Text("Dark Mode")
            Spacer()
            Toggle(isOn: $vm.toggleAction,label: {
                
            })
            .frame(width: 50, height: 50)
        }
        .padding()
        .foregroundColor(.white)
    }
}
