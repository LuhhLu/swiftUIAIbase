 




import SwiftUI

struct HomeView: View {
    @State var Agree = false
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing:44){
                Spacer()
                VStack(alignment:.leading,spacing: 8){
                    Text("Create Account").font(.largeTitle).bold()
                    Text("Please fill the form to continue")
                        .foregroundStyle(.secondary)
                }
                signView()
                TermsAndPrivacyView(Agree: $Agree)
                SignButton(Agree: $Agree)
                    .padding(.top,24)
                
            }
            .safeAreaPadding(.horizontal)
        }
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    HomeView()
}
