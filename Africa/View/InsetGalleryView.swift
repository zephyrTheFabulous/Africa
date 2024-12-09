//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - PROPERTIES

  let animal: Animal // no value since this row will be populated with the data by its parent View

    //MARK: - BODY
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 15) {
          ForEach(animal.gallery, id: \.self) { item in // since photos don't have ID ints, we must use their ID strings
            Image(item)
              .resizable()
              .scaledToFit()
              .frame(height: 200)
              .clipShape(.rect(cornerRadius: 12))
          } //: LOOP
      } //: HSTACK
      } //: SCROLL
    }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview purposes
  InsetGalleryView(animal: animals[0])
}
