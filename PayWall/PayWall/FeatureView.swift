 
import SwiftUI

struct Feature: Identifiable {
    var id = UUID()
    var icon: String
    var color: Color
    var title: String
    var description: String
}
struct FeatureView: View {
    var feature: Feature

    var body: some View {
        
        HStack(spacing:12){
            ZStack{
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(feature.color.opacity(0.2))
                Image(systemName: feature.icon)
                    .foregroundStyle(feature.color)
                    .font(.system(size: 18).bold())
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(NSLocalizedString(feature.title, comment: ""))
                    .font(.system(size: 16).bold())
                Text(NSLocalizedString(feature.description, comment: ""))
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.leading)

            }
          
                
            Spacer()
        }
        
        
    }
}


#Preview {
    FeatureView(feature: Feature(icon: "bell.fill", color: .orange, title: "Tareas ilimitadas", description: "Establece recordatorios y alertas para no perder nunca una fecha límite")
    )
}

 
