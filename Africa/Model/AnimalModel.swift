  //
  //  AnimalModel.swift
  //  Africa
  //
  //  Created by Anthony on 21/10/24.
  //

import Foundation

struct Animal: Codable, Identifiable {
  var id: String // since there is no ID, only String names
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
