//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Anthony on 21/10/24.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK: - PROPERTIES

  let animal: Animal // no value since this row will be populated with the data by its parent View
    //Change it's preview the same as CoverImageView?

    //MARK: - BODY
    var body: some View {
      HStack(alignment: .center, spacing: 16) {
        Image(animal.image)
          .resizable()
          .scaledToFill()
          .frame(width: 90, height: 90)
          .clipShape(.rect(cornerRadius: 12))

        VStack(alignment: .leading, spacing: 8) {
          Text(animal.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(.accent)

          Text(animal.headline)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .padding(.trailing, 8)
        } //: VSTACK
      } //: HSTACK
    }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview purposes
  AnimalListItemView(animal: animals[1])
}
