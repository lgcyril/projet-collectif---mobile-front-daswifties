import SwiftUI
import MapKit


struct realmap: View {
    private var pointsOfInterest = [
        AnnotatedItem(name: "Villa Bela Kiss", coordinate: .init(latitude: 49.4300997, longitude: 2.0823355)),
        AnnotatedItem(name: "Hôpital Joe Jill", coordinate: .init(latitude: 48.838244838151695, longitude: 2.2958699602637145)),
        AnnotatedItem(name: "Hôpital Earle Nelson", coordinate: .init(latitude: 48.8371047, longitude: 2.331406))
    ]
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.86, longitude: 2.33), span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
            MapAnnotation(coordinate: item.coordinate) {
                            Image(item.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 25)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 25/10))
                                .shadow(radius: 10)
                        }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct realmap_Previews: PreviewProvider {
    static var previews: some View {
        realmap()
    }
}
