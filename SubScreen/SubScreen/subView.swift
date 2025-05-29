
import SwiftUI

enum SubscriptionType {
    case monthly
    case yearly
}
struct subView: View {
    var title: String
    var sale: String
    var price: String
    var details: String
    var type: SubscriptionType
    @Binding var selectedSubscription: SubscriptionType?
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.black.gradient)
            CircleView(show: .constant(selectedSubscription == type))
                .offset(x: 60, y: -60)
        }
        .frame(width: 170, height: 170)
        .contentShape(Rectangle())
        .overlay(content: {
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedSubscription == type ? .blue : .clear,lineWidth: 3)
        })
        .overlay(alignment: .topLeading, content: {
            VStack(alignment:.leading){
                Text(title).bold().font(.title2)
                Spacer()
                VStack(alignment:.leading,spacing:1){
                    if type == .yearly {
                        ZStack{
                            Text(sale)
                                .foregroundStyle(.secondary)
                            Rectangle()
                                .frame(width: 40, height: 2)
                                .rotationEffect(.degrees(-20))
                                .foregroundStyle(.gray)
                        }.bold()
                     
                    }
                    Text(price).font(.largeTitle.bold())
                    Spacer()
                    Text(details)
                    
                }
            }
            .foregroundStyle(selectedSubscription == type ? .black : .white)
            .padding()
        })
        .onTapGesture {
            withAnimation {
                selectedSubscription = selectedSubscription == type ? nil : type
            }
        }
        .clipShape(.rect(cornerRadius: 20))
    
    }
}

#Preview {
    HomeView()
}
struct CircleView: View {
    @Binding var show :Bool
    var body: some View {
        Group{
            Circle()
                .frame(width: show ? 500 : 30, height: show ? 500 : 30)
                .foregroundStyle(.white)
            Image(systemName: show ? "checkmark.circle.fill" : "circle.fill").font(.system(size: 30))
                .foregroundStyle(show ? .blue : .white)
                .contentTransition(.symbolEffect)
            
        }
    }
}

 
