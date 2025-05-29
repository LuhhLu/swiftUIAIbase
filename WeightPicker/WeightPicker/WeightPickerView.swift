import SwiftUI

struct WeightPickerView: View {
    @State var selectedUnit: String = "kg"
    @State var selectedWeight: Int = 60
    
    var body: some View {
        VStack {
            Picker("Unit", selection: $selectedUnit) {
                Text("kg").tag("kg")
                Text("lbs").tag("lbs")
                   
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal,9)
            .onChange(of: selectedUnit) { _,_ in
                 if selectedUnit == "kg" {
                    selectedWeight = min(max(30, selectedWeight), 150) // Reset range for kg
                } else {
                    selectedWeight = min(max(66, selectedWeight), 330) // Reset range for lbs
                }
            }
            
//            // Number Picker for Weight
            Picker("Weight", selection: $selectedWeight) {
                ForEach(selectedUnit == "kg" ? Array(30...150) : Array(66...330), id: \.self) { weight in
                    Text("\(weight)").tag(weight)
                }
            }
            .pickerStyle(.wheel).frame(height: 150).clipped()
        
            // Buttons
            HStack(spacing:30) {
                Button("Cancel") { }
                .frame(maxWidth: .infinity).padding(10)
                .background(.gray.opacity(0.16),in:.rect(cornerRadius: 8))
                .tint(.primary)
                
                Button("Done") { print("Selected: \(selectedWeight) \(selectedUnit)")}
                .frame(maxWidth: .infinity)
                .padding(10)
                .foregroundColor(.white)
                .background(.purple,in:.rect(cornerRadius: 8))
             
            }
            .padding(.horizontal,10)
       
         
        }.padding()
        .background(.gray.opacity(0.2),in:.rect(cornerRadius: 24))
 
        .padding()
    }
}

#Preview {
    WeightPickerView()
}
