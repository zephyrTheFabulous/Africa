//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Anthony on 24/10/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - PROPERTIES

  let animal: Animal

    //MARK: - BODY
    var body: some View {
      Image(animal.image)
        .resizable()
        .scaledToFit()
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview
  AnimalGridItemView(animal: animals[0])
}
