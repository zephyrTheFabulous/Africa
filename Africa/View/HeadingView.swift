//
//  HeadingView.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - PROPERTIES

  var headingImage: String
  var headingText: String

    //MARK: - BODY

    var body: some View {
      HStack {
        Image(systemName: headingImage)
          .foregroundStyle(.accent)
          .imageScale(.large)
        Text(headingText)
          .font(.title3)
          .fontWeight(.bold)
      }//: VSTACK
      .padding(.vertical, 16)
    }
}

#Preview {
  HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
}
