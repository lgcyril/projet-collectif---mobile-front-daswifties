import Foundation
import MapKit

struct JSONData: Decodable {
  let pointsOfInterest: [AnnotatedItem]
}

struct AnnotatedItem: Decodable, Identifiable {
  let id: Int
  let name: String
  let latitude: Double
  let longitude: Double
}

