import Foundation
import MapKit

//struct JSONData: Decodable {
//  let pointsOfInterest: [AnnotatedItem]
//}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}


