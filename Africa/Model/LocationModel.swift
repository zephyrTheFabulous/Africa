  //
  //  LocationModel.swift
  //  Africa
  //
  //  Created by Anthony on 23/10/24.
  //

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double

  // Computed property consisting of two properties latitude and longitude
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
