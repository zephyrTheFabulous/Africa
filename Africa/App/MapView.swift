  //
  //  MapView.swift
  //  Africa
  //
  //  Created by Anthony on 21/10/24.
  //

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES

  @State private var region: MapCameraPosition = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599) // coordinates
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0) // zoom level
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel) // combination of coordinates and zoom

    return MapCameraPosition.region(mapRegion)
  }()

  @State private var latitude: String = "6.600286"


  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    //MARK: - BODY
  var body: some View {
      // 1. BASIC MAP. NO ANNOTATIONS
      //    Map(position: $region)

      // 2. ADVANCED MAP WITH ANNOTATIONS
      //      Map(coordinateRegion: $region,  annotationItems: locations, annotationContent: { item in

    Map(position: $region) {
      ForEach(locations) { item in
        Annotation(item.name, coordinate: item.location) {

            // (A) PIN: OLD STYLE (always static)
//                    MapPin(coordinate: item.location, tint: .accent)

            // (B) MARKER: NEW STYLE (always static)
//                    MapMarker(coordinate: item.location, tint: .accent)

            // (C) CUSTOM BASIC ANNOTATIONS (could be interactive)
//          MapAnnotation(coordinate: item.location) {
//            Image("logo")
//              .resizable()
//              .scaledToFit()
//              .frame(width: 32, height: 32)
//          } //: ANNOTATION

            // (D) CUSTOM ANNOTATION (could be interactive)
          MapAnnotationView(location: item)

        } //: ANNOTATION
      } //: LOOP
    } //: ADVANCED MAP
//    .overlay(alignment: .top) {
//      HStack(alignment: .center, spacing: 12) {
//        Image("compass")
//          .resizable()
//          .scaledToFit()
//          .frame(width: 48, height: 48)
//
//        VStack(alignment: .leading, spacing: 3) {
//          HStack {
//            Text("Latitude:")
//              .font(.footnote)
//              .fontWeight(.bold)
//              .foregroundStyle(.accent)
//            Spacer()
//            Text("\(region)") // ИСПРАВИТЬ
//              .font(.footnote)
//              .foregroundStyle(.white)
//          }
//          Divider()
//          HStack {
//            Text("Longitude:")
//              .font(.footnote)
//              .fontWeight(.bold)
//              .foregroundStyle(.accent)
//            Spacer()
//            Text("\(region.region?.center.longitude)") // ИСПРАВИТЬ
//              .font(.footnote)
//              .foregroundStyle(.white)
//          }
//        } //: VSTACK
//      } //: HSTACK
//      .padding(.vertical, 12)
//      .padding(.horizontal, 16)
//      .background(
//        Color.black
//          .clipShape(.rect(cornerRadius: 8))
//          .opacity(0.6)
//      )
//      .padding()
//    } //: OVERLAY
  }
}

#Preview {
  MapView()
}

