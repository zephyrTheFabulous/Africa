  //
  //  AnimalDetailView.swift
  //  Africa
  //
  //  Created by Anthony on 22/10/24.
  //

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES

  let animal: Animal // no value since this row will be populated with the data by its parent View

    //MARK: - BODY
  var body: some View {
    ScrollView(.vertical) {
      VStack(alignment: .center, spacing: 20) {
          // HERO IMAGE
        Image(animal.image)
          .resizable()
          .scaledToFit()
          // TITLE
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .padding(.vertical, 8)
          .foregroundStyle(.primary)
          .background(
            Color.accent
              .frame(height: 8)
              .offset(y: 24)
          )
          // HEADLINE
        Text(animal.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundStyle(.accent)
          .padding(.horizontal, 16)

          // GALLERY
        Group { // to avoid View limitation
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
          InsetGalleryView(animal: animal)
        }
        .padding(.horizontal, 16)

          // FACTS
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
          InsetFactView(animal: animal)
        }
        .padding(.horizontal, 16)

          // DESCRIPTION
        Group {
          HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal, 16)

          // MAP
        Group {
          HeadingView(headingImage: "map", headingText: "National Parks")

          InsetMapView()
        }
        .padding(.horizontal, 16)

          // LINK
        Group {
          HeadingView(headingImage: "books.vertical", headingText: "Learn more")
          ExternalWeblinkView(animal: animal)
        }
        .padding(.horizontal, 16)

      } //: VSTACK
      .navigationTitle("Learn about \(animal.name)")
      .navigationBarTitleDisplayMode(.inline)
    } //: SCROLL
  }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview purposes
  NavigationStack {
    AnimalDetailView(animal: animals[0])
    }
}
