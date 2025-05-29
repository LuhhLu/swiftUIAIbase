import SwiftUI

struct TipView: View {
    @State  var selectedTip: String = ""
    @State  var showCustomTipSheet = false
    @State  var customTipInput = ""

    let tipOptions = ["$2.00", "$4.00", "$6.00", "$10.00","$20.00"]

    var displayedTip: String {
        // if it is empty by default will be "$0.00" else selectedTip
        return selectedTip.isEmpty ? "$0.00" : selectedTip
    }
    var action: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            TipDetails
            VStack(alignment: .leading, spacing: 24) {
                HStack{
                    Text("Tip amount:")
                    Text(displayedTip)
                    Spacer()
                    Button {
                        withAnimation {
                            // we will show the costume sheet of view I mean this one
                            showCustomTipSheet = true
                            // and as you know, we have already this row of tips I need to make sure when I click on the custom tip button always the customTipInput will be empty
                            customTipInput = ""
                        }
                    } label: {
                        Text("Custom tip")

                    }
                }
                
                TipRow
            }
            SendButton
        }
        .safeAreaPadding()
        .overlay {
            if showCustomTipSheet {
                CustomTip(customTip: $customTipInput, isPresented: $showCustomTipSheet, selectedTip: $selectedTip)
                    .transition(.offset(y: 900))
            }
        }
        
 
    }
    
    var TipDetails: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Add a tip")
            Text("100% of your tip goes directly to Sara. Your generosity helps show appreciation for great service!")
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
    }
    var TipRow: some View {
        ScrollView(.horizontal) {
            HStack(spacing:12){
                ForEach(tipOptions,id:\.self) { tip in
                    TipButton(label: tip, isSelected: selectedTip == tip) {
                        if selectedTip == tip{
                            // that is mean if I select for example, two dollars and then I select it again it will just make it empty. Does this mean he will just cancel the selection
                            selectedTip = ""
                        }else{
    //                        And the one we were selected will be the tip amount
                            selectedTip = tip
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
       
       
    }
    var SendButton: some View {
        Button(action: {
            action()
        }) {
            Text("Send")
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .foregroundStyle(.LD)
                .background(.primary)
                .clipShape(.capsule)
        }
        .tint(.primary)
        .padding(.top, 30)
    }
}
struct TipButton: View {
    let label: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(isSelected ? Color.primary : .gray.opacity(0.3),in:.capsule)
                .foregroundStyle(isSelected ? .LD : .primary)
        }

    }
}


#Preview {
    TipView(action: {})
}
