 
import SwiftUI

struct HomeVew: View {
    @StateObject var viewmodel = PostGrip()
    var body: some View {
        let columns : [ GridItem] = [GridItem(.flexible()),GridItem(.flexible())]
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 13){
                    Text("Trending").bold()
                        .font(.title)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(MacData.Titems){ items in
                               trend(datam: items)
                            }
                        }

                    }
                    Text("Posts").bold()
                        .font(.title)
                    LazyVGrid(columns: columns){
                        ForEach(MacData.Pitems){ items in
                            post(datam: items)
                                .onTapGesture {
                                    viewmodel.slected = items
                                }
                        }
                    }
                    
                }
            }
            .padding()
            .sheet(isPresented: $viewmodel.didsetPost){
                Profile(datam: viewmodel.slected!)
            }
        }
    }
}

struct HomeVew_Previews: PreviewProvider {
    static var previews: some View {
        HomeVew()
    }
}
