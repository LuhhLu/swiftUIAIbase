 
import SwiftUI

struct ActivityCard: View {
    let icon: String
    let title: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: icon).font(.system(size: 27))
                .frame(height: 30)
                .padding(10)
                .background(alignment: .center) {
                    Circle().foregroundStyle(.white.opacity(0.2))
                        .frame(width: 45, height: 45)
                }
            Spacer()
            Text(title)
                .font(.headline)
        }
        .padding(10)
        .padding(.vertical, -3)
        .frame(width: 110,height: 100)
        .background(backgroundColor,in:.rect(cornerRadius: 12))
    }
}
struct ActivityView: View {
    var body: some View {
        VStack{
            HStack(spacing: 16) {
                ActivityCard(icon: "flame.fill", title: "Burn", backgroundColor: .red)
                ActivityCard(icon: "dumbbell", title: "Lift", backgroundColor: .purple)
                ActivityCard(icon: "figure.skiing.downhill", title: "Ski", backgroundColor: .cyan)

            }
            HStack(spacing: 16) {
                      ActivityCard2(icon: "figure.walk", title: "Walking", backgroundColor: .teal)
                      ActivityCard2(icon: "flame.fill", title: "Workout", backgroundColor: .orange)
                      ActivityCard2(icon: "figure.mind.and.body", title: "Meditation", backgroundColor: .purple)
                  }

            HStack(spacing: 16) {
                ActivityCard3(icon: "flame.fill", title: "Burn", backgroundColor: .red)
                ActivityCard3(icon: "dumbbell", title: "Lift", backgroundColor: .purple)
                ActivityCard3(icon: "figure.skiing.downhill", title: "Ski", backgroundColor: .cyan)

            }
        }
      
        .padding()
    }
}

#Preview {
    ActivityView()
}

struct ActivityCard2: View {
   let icon: String
   let title: String
   let backgroundColor: Color
   
   var body: some View {
       VStack(alignment: .leading,spacing: 0) {
           Image(systemName: icon).font(.system(size: 27))
               .frame(maxWidth: .infinity,alignment: .trailing)
           Spacer()
           Text(title)
               .font(.headline)
       }
    
       .padding(10)
       .padding(.vertical, -3)
       .foregroundStyle(backgroundColor)
       .frame(height: 100)
       .background(backgroundColor.opacity(0.2),in:.rect(cornerRadius: 12))
   }
}
 
struct ActivityCard3: View {
    let icon: String
    let title: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            Image(systemName: icon).font(.system(size: 27))
                .frame(maxWidth: .infinity,alignment: .trailing)
                .frame(height: 30)
            Spacer()
            Text(title)
                .font(.headline)
        }
        .padding(10)
        .padding(.vertical, -3)
        .frame(height: 100)
        .background(backgroundColor,in:.rect(cornerRadius: 12))
    }
}
 
