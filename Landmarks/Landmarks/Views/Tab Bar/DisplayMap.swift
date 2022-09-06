//import SwiftUI
//import MapKit
//
//
//struct DisplayMap: View {
//
//    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.85, longitude: 2.35), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
//
//    @State private var pointsOfInterest: [Record] = []
//
//
//    init(records: [Record]) {
//        records.forEach { record in
//            record
//            pointsOfInterest.append(record)
//        }
//    }
//
//    var body: some View {
//        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
//
//
//            MapAnnotation(coordinate: item.coordinate) {
//                Image(item.name)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 25)
//                    .clipShape(Circle())
//                    .overlay(
//                        Circle().stroke(Color.white, lineWidth: 25/10))
//                    .shadow(radius: 10)
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct DisplayMap_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayMap()
//    }
//}
//
//
