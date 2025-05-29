 
import Foundation
struct PostModel: Identifiable{
    var id = UUID()
    var image:String
    var titel:String
    var by:String
    var avtar:String
}
struct TrendModel:Identifiable{
    var id = UUID()
    var image:String
    var avtar:String
    var count:String
}
struct Gallery:Identifiable{
    var id = UUID()
    var imagename:String
}
struct MacData {
    static var psimple = PostModel(image: "c1", titel: "adstract colorful", by: "sara", avtar: "p6")
    static var tsimple = TrendModel(image: "A1", avtar: "p1", count: "10k")
    static var gallery: [Gallery] = [
        Gallery(imagename: "A1"),
        Gallery(imagename: "c2"),
        Gallery(imagename: "c3"),
        Gallery(imagename: "c4"),
        Gallery(imagename: "c5"),
        Gallery(imagename: "A5"),
        Gallery(imagename: "A6"),
        Gallery(imagename: "A7"),
        Gallery(imagename: "A3")
    ]
    static var Pitems : [PostModel] = [
        PostModel(image: "A7", titel: "Abstract colorful", by: "ankedo",avtar: "p1"),
        PostModel(image: "c2", titel: "Lighthouse at Mclain", by: "nada" ,avtar: "p2"),
        PostModel(image: "c3", titel: "romantic dog", by: "david",avtar: "p3" ),
        PostModel(image: "c4", titel: "skull skateboard ", by: "joni" ,avtar: "p4"),
        PostModel(image: "c5", titel: "Vintage Classic ", by: "tomas" ,avtar: "p5"),
        PostModel(image: "A6", titel: "the old one ", by: "sara" ,avtar: "p6")
    ]
    static var Titems : [TrendModel] = [
        TrendModel(image: "A1", avtar: "p1", count: "10 k"),
        TrendModel(image: "A2", avtar: "p2", count: "53 k"),
        TrendModel(image: "A3", avtar: "p3", count: "27 k"),
        TrendModel(image: "A4", avtar: "p4", count: "1 m"),
        TrendModel(image: "A5", avtar: "p5", count: "200 k"),
        TrendModel(image: "A6", avtar: "p6", count: "324 k")
    ]
    
    
}
