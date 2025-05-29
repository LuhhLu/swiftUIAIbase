 


import Foundation

struct Book: Identifiable, Equatable, Hashable {
    let id: String
    let name: String
    let pagesCount: Int
    let header: String
    let description: String
    let coverImage: String
    let fileName: String
    let rating: Double
}

extension Book {
    static let mock: [Book] = [
        Book(
            id: "1",
            name: "SwiftUI",
            pagesCount: 156,
            header: "Introduction",
            description: """
Learn how to build high-quality Facebook-like social media applications with SwiftUI. This book guides you through creating seamless user interfaces, managing data efficiently, and integrating advanced features like real-time updates and push notifications. From setting up your project to deploying a professional-grade app, this comprehensive guide has you covered.
Learn how to build high-quality Facebook-like social media applications with SwiftUI. This book guides you through creating seamless user interfaces, managing data efficiently, and integrating advanced features like real-time updates and push notifications. From setting up your project to deploying a professional-grade app, this comprehensive guide has you covered.
Learn how to build high-quality Facebook-like social media applications with SwiftUI. This book guides you through creating seamless user interfaces, managing data efficiently, and integrating advanced features like real-time updates and push notifications. From setting up your project to deploying a professional-grade app, this comprehensive guide has you covered.
Learn how to build high-quality Facebook-like social media applications with SwiftUI. This book guides you through creating seamless user interfaces, managing data efficiently, and integrating advanced features like real-time updates and push notifications. From setting up your project to deploying a professional-grade app, this comprehensive guide has you covered.
""",
            coverImage: "B",
            fileName: "FakeBook",
            rating: 4.7
        ),
        Book(
            id: "2",
            name: "iOS Development",
            pagesCount: 192,
            header: "Introduction to iOS Development",
            description: """
Dive into iOS development with this practical guide designed for beginners and professionals alike. Explore the essentials of Swift programming, UIKit, and SwiftUI, and learn how to create powerful and responsive applications. From mastering Xcode to implementing core iOS features, this book provides everything you need to succeed in iOS development.
Dive into iOS development with this practical guide designed for beginners and professionals alike. Explore the essentials of Swift programming, UIKit, and SwiftUI, and learn how to create powerful and responsive applications. From mastering Xcode to implementing core iOS features, this book provides everything you need to succeed in iOS development.
Dive into iOS development with this practical guide designed for beginners and professionals alike. Explore the essentials of Swift programming, UIKit, and SwiftUI, and learn how to create powerful and responsive applications. From mastering Xcode to implementing core iOS features, this book provides everything you need to succeed in iOS development.
""",
            coverImage: "B1",
            fileName: "FakeBook",
            rating: 4.5
        ),
        Book(
            id: "3",
            name: "Swift Data",
            pagesCount: 176,
            header: "Data Management in Swift",
            description: """
Discover the art of saving, retrieving, and managing data in Swift. This book covers everything from Core Data to the new Swift Data framework, helping you build robust and scalable applications. Whether you're working on a small app or a complex system, you'll find techniques and strategies to handle your data efficiently and securely.
Discover the art of saving, retrieving, and managing data in Swift. This book covers everything from Core Data to the new Swift Data framework, helping you build robust and scalable applications. Whether you're working on a small app or a complex system, you'll find techniques and strategies to handle your data efficiently and securely.Discover the art of saving, retrieving, and managing data in Swift. This book covers everything from Core Data to the new Swift Data framework, helping you build robust and scalable applications. Whether you're working on a small app or a complex system, you'll find techniques and strategies to handle your data efficiently and securely.
""",
            coverImage: "B2",
            fileName: "FakeBook",
            rating: 4.8
        ),
        Book(
            id: "4",
            name: "Master SwiftUI",
            pagesCount: 210,
            header: "Advanced SwiftUI Techniques",
            description: """
Take your SwiftUI skills to the next level with this advanced guide to mastering iOS 18 app development. From creating complex UIs to leveraging new features in SwiftUI and iOS 18, this book is perfect for developers who want to stay ahead in the ever-evolving world of Apple development. Enhance your skills with real-world examples and expert tips.
Take your SwiftUI skills to the next level with this advanced guide to mastering iOS 18 app development. From creating complex UIs to leveraging new features in SwiftUI and iOS 18, this book is perfect for developers who want to stay ahead in the ever-evolving world of Apple development. Enhance your skills with real-world examples and expert tips.
""",
            coverImage: "B3",
            fileName: "FakeBook",
            rating: 5.0
        )
    ]
}

