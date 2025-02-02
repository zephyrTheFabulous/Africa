//
//  CoverImageView.swift
//  Africa
//
//  Created by Anthony on 21/10/24.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES

  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    //MARK: - BODY
    var body: some View {
      TabView {
        ForEach(coverImages) { item in
          Image(item.name)
            .resizable()
            .scaledToFill()
        } //: LOOP
      } //: TAB
      .tabViewStyle(.page)
    }
}

#Preview {
    CoverImageView()
}
