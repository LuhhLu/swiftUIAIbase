

import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
   var activityItems: [Any]

   func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
       let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
       return controller
   }

   func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {
   }
}
