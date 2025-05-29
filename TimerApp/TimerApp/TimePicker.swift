 
import SwiftUI

struct TimePicker: View {
    @Binding var hours: Int
    @Binding var min: Int
    @Binding var sec: Int
    var body: some View {
        HStack{
            CustomPicker(for: $hours, range: 0..<24, lable: "hours")
            CustomPicker(for: $min, range: 0..<60, lable: "min")
            CustomPicker(for: $sec, range: 0..<60, lable: "sec")
        }
      
    }
    @ViewBuilder
    func CustomPicker(for selection:Binding <Int> , range:Range<Int>, lable:String ) -> some View{
        HStack(spacing:0){
            Picker(selection:selection,label: Text("")){
                ForEach(range,id:\.self){ title in
                    Text("\(title)")
                }
            }
            .pickerStyle(.wheel)
            Text(lable)
                .lineLimit(1)
        }
    }
}

#Preview {
    TimePicker(hours: .constant(1), min: .constant(2), sec: .constant(0))
}
