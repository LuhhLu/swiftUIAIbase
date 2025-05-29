 








import SwiftUI

struct HomeView: View {
    @State var StepsNum: Int = 5
    @State var CurrentStep: Int = 0
    var body: some View {
        ScrollView{
            VStack(spacing:80){
                
                StyleOne(StepsNum: 4, CurrentStep: $CurrentStep)
          
                StyleTow(StepsNum: 3, CurrentStep: $CurrentStep)
          
                StyleThree(StepsNum: 4, CurrentStep: $CurrentStep)
         
                StyleFour(StepsNum: 5, CurrentStep: $CurrentStep)

                HStack {
                    Button(action: {
                        withAnimation {
                            if CurrentStep > 0 {
                                CurrentStep -= 1
                            }
                        }
                        
                    }, label: {
                        Text("Back")
                    })
                    .padding(.horizontal)
                    Button(action: {
                        withAnimation {
                            if CurrentStep < StepsNum  {
                                CurrentStep += 1
                            }
                        }
                        
                    }, label: {
                        Text("Next")
                    })
                    .padding(.horizontal)
                    
                    
                }
                .font(.largeTitle)
                .offset(y: 10)
            }
            .tint(.primary)
            .padding(.horizontal)
        }
     

    }
}

#Preview {
    HomeView()
}
