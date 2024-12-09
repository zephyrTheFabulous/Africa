  //
  //  InsetMapView.swift
  //  Africa
  //
  //  Created by Anthony on 22/10/24.
  //

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES

  @State private var region = MapCameraPosition.region(MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), // location
    span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))) // zoom level. The smaller the value - the higher the zoom

    //MARK: - BODY
  var body: some View {
    Map(position: $region)
      .overlay(alignment: .topTrailing) {
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundStyle(.white)
              .imageScale(.large)
            Text("Locations")
              .foregroundStyle(.accent)
              .fontWeight(.bold)
          } //: HSTACK
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(Color.black
            .opacity(0.4)
            .clipShape(.rect(cornerRadius: 8))
          )
        } //: LINK
        .padding(12)
      }
      .frame(height: 256)
      .clipShape(.rect(cornerRadius: 12))
  }
}

#Preview {
  InsetMapView()
}
