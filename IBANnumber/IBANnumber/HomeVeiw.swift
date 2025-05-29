 

import SwiftUI
struct IBANModel: Identifiable {
    var id = UUID()
    var CountryCode: String
    var maxNumbers: Int
}
struct HomeVeiw: View {
    @State var TextInput = ""
    @State var Result = ""
    var IBANS: [IBANModel] = [
        IBANModel(CountryCode: "NO", maxNumbers: 15), // Norway
        IBANModel(CountryCode: "BE", maxNumbers: 16), // Belgium
        IBANModel(CountryCode: "DK", maxNumbers: 18), // Denmark
        IBANModel(CountryCode: "FO", maxNumbers: 18), // Faroe Islands
        IBANModel(CountryCode: "FI", maxNumbers: 18), // Finland
        IBANModel(CountryCode: "GL", maxNumbers: 18), // Greenland
        IBANModel(CountryCode: "NL", maxNumbers: 18), // Netherlands
        IBANModel(CountryCode: "MK", maxNumbers: 19), // North Macedonia
        IBANModel(CountryCode: "SI", maxNumbers: 19), // Slovenia
        IBANModel(CountryCode: "AT", maxNumbers: 20), // Austria
        IBANModel(CountryCode: "EE", maxNumbers: 20), // Estonia
        IBANModel(CountryCode: "KZ", maxNumbers: 20), // Kazakhstan
        IBANModel(CountryCode: "LT", maxNumbers: 20), // Lithuania
        IBANModel(CountryCode: "LU", maxNumbers: 20), // Luxembourg
        IBANModel(CountryCode: "XK", maxNumbers: 20), // Kosovo
        IBANModel(CountryCode: "BA", maxNumbers: 20), // Bosnia and Herzegovina
        IBANModel(CountryCode: "ME", maxNumbers: 22), // Montenegro
        IBANModel(CountryCode: "DE", maxNumbers: 22), // Germany
        IBANModel(CountryCode: "GB", maxNumbers: 22), // United Kingdom
        IBANModel(CountryCode: "GI", maxNumbers: 23), // Gibraltar
        IBANModel(CountryCode: "IE", maxNumbers: 22), // Ireland
        IBANModel(CountryCode: "RS", maxNumbers: 22), // Serbia
        IBANModel(CountryCode: "IS", maxNumbers: 26), // Iceland
        IBANModel(CountryCode: "IT", maxNumbers: 27), // Italy
        IBANModel(CountryCode: "MT", maxNumbers: 31), // Malta
        IBANModel(CountryCode: "MC", maxNumbers: 27), // Monaco
        IBANModel(CountryCode: "MD", maxNumbers: 24), // Moldova
        IBANModel(CountryCode: "SM", maxNumbers: 27), // San Marino
        IBANModel(CountryCode: "SA", maxNumbers: 24), // Saudi Arabia
        IBANModel(CountryCode: "SK", maxNumbers: 24), // Slovakia
        IBANModel(CountryCode: "ES", maxNumbers: 24), // Spain
        IBANModel(CountryCode: "SE", maxNumbers: 24), // Sweden
        IBANModel(CountryCode: "CH", maxNumbers: 21), // Switzerland
        IBANModel(CountryCode: "TR", maxNumbers: 26), // Turkey
        IBANModel(CountryCode: "UA", maxNumbers: 29), // Ukraine
        IBANModel(CountryCode: "VA", maxNumbers: 22), // Vatican City
        IBANModel(CountryCode: "PT", maxNumbers: 25), // Portugal
        IBANModel(CountryCode: "PL", maxNumbers: 28), // Poland
        IBANModel(CountryCode: "RO", maxNumbers: 24), // Romania
        IBANModel(CountryCode: "HU", maxNumbers: 28), // Hungary
        IBANModel(CountryCode: "GR", maxNumbers: 27), // Greece
        IBANModel(CountryCode: "FR", maxNumbers: 27), // France
        IBANModel(CountryCode: "CZ", maxNumbers: 24), // Czech Republic
        IBANModel(CountryCode: "CY", maxNumbers: 28), // Cyprus
        IBANModel(CountryCode: "HR", maxNumbers: 21), // Croatia
        IBANModel(CountryCode: "BG", maxNumbers: 22), // Bulgaria
        IBANModel(CountryCode: "AL", maxNumbers: 28), // Albania
        IBANModel(CountryCode: "AD", maxNumbers: 24)  // Andorra
    ]
    var body: some View {
        VStack(alignment:.leading){
        Text("Result\(Result)")
            IBANnumberView(IBANS: IBANS, text: $TextInput)
            .onChange(of: TextInput) { old, newValue in
                Result = newValue.replacingOccurrences(of: " ", with: "").uppercased()
            }
        }
        .padding()
    }
}

#Preview {
    HomeVeiw()
}
