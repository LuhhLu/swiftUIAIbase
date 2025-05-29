 
import SwiftUI
import Network
struct ContentView: View {
    @State  var isConnected = false
    @State  var showNotification = false
    @State  var wasDisconnected = false
      let monitor = NWPathMonitor()
      let queue = DispatchQueue(label: "NetworkMonitor")
    var body: some View {
        ZStack {
            if !isConnected{
                ConnectionLost
            }else{
                Text("Your View").bold()
                    .font(.largeTitle)
            }
            WifiNotiftow(isConnected: $isConnected)
                .frame(maxHeight: .infinity,alignment: .top)
                .offset(y: showNotification ? -20 : -200)
                .padding()
                .onAppear{
                    startMonitoring()
                }
            
          
            
        }
        .padding()
    }
    var ConnectionLost:some View{
        VStack(spacing:10){
            Image(systemName: "wifi.slash")
                .font(.system(size: 100))
                .foregroundStyle(.secondary)
            Text("Internet Connection Lost")
                .font(.title)
            Text("Please check your connection or go to WiFi settings to reconnect.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Button(action: {
                openWiFiSettings()
            }, label: {
                Text("Open Settings")
                    .font(.headline)
            })
            .tint(.blue)
            .buttonStyle(.bordered)
            .padding(.top)
        }
        .frame(width: 300)
    }
    func openWiFiSettings(){
        if let url = URL(string: UIApplication.openSettingsURLString){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
                 
        }
    }
    func startMonitoring(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                let currentStatus = path.status == .satisfied
                if self.isConnected != currentStatus {
                    if currentStatus{
                        if self.wasDisconnected{
                            self.showNotification = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                                withAnimation {
                                    self.showNotification = false
                                }
                            }
                        }
                    }else{
                        self.showNotification = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            withAnimation {
                                self.showNotification = false
                            }
                        }
                        self.wasDisconnected = true
                        
                        
                    }
                    self.isConnected = currentStatus
                }
            }
            
        }
        monitor.start(queue: queue)
    }
}

#Preview {
    ContentView()
}
