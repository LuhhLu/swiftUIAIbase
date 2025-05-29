import SwiftUI

struct Teams: Identifiable {
   var id  = UUID()
   var title:String
   var members: [Tmembers]
}
struct Tmembers:Identifiable{
   var id = UUID()
   var image:ImageResource
   var name: String
   var jobTitle:String
}
struct HomeView: View {
   
   let teams: [Teams] = [
          Teams(
              title: "Team Alpha",
              members: [
                  Tmembers(image: .im1, name: "Alice Johnson", jobTitle: "Senior Designer"),
                  Tmembers(image: .im2, name: "Bob Smith", jobTitle: "Programmer"),
                  Tmembers(image: .im3, name: "Charlie Brown", jobTitle: "Illustrator"),
                 
              ]
          ),
          Teams(
              title: "Team Beta",
              members: [
                  Tmembers(image: .im4, name: "Dave Adams", jobTitle: "Team Lead"),
                  Tmembers(image: .im5, name: "Eve Turner", jobTitle: "Product Manager"),
                  Tmembers(image: .im1, name: "Frank Black", jobTitle: "Programmer"),
                  Tmembers(image: .im2, name: "Grace Walker", jobTitle: "UI Designer")
              ]
          )
      ]
   var body: some View {
       NavigationStack {
           ScrollView{
               ForEach(teams) { team in
                   TeamCell(teams: [team])
               }
           }
           .navigationTitle("Teams")
       }
       
   }
}

#Preview {
   HomeView()
}
