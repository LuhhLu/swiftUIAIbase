 

import SwiftUI
import Observation

@Observable
class Document: Identifiable, Equatable, Hashable {
    var title: String
    var body: AttributedString
    
    init(title: String) {
        self.title = title
        self.body = ""
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Document, rhs: Document) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title && lhs.body == rhs.body
    }
}

class FullWidthImageAttachment: NSTextAttachment {
    override func attachmentBounds(for textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        guard let image = self.image else {
            return .zero
        }

        let containerWidth = lineFrag.width
        let imageRatio = image.size.height / image.size.width
        
        // Return a CGRect that maintains the aspect ratio while using the container's width
        return CGRect(x: 0, y: 0, width: containerWidth, height: containerWidth * imageRatio)
    }
}

extension Document {
    func insertImage(_ image: UIImage, at range: NSRange? = nil) {
        let attachment = FullWidthImageAttachment()
        attachment.image = image
        let imageString = NSAttributedString(attachment: attachment)
        
        let updatedBody = NSMutableAttributedString(body)
        
        // Replace the content in the specified range or append the image at the end
        if let range = range {
            // Replace the selected range with the image
            updatedBody.replaceCharacters(in: range, with: imageString)
        } else {
            // Append the image at the end if no range is provided
            updatedBody.append(imageString)
        }
        
        // Add a new line after the image
        updatedBody.append(NSAttributedString(string: "\n"))
        
        // Update the body to reflect changes
        body = AttributedString(updatedBody)
    }
}
