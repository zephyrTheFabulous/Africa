//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Anthony on 23/10/24.
//

import SwiftUI

// ICON WITH ANIMAL FOR MAP

struct MapAnnotationView: View {
    //MARK: - PROPERTIES

  var location: NationalParkLocation

  @State private var animation: Double = 0.0

    //MARK: - BODY
    var body: some View {
      ZStack {
        Circle() // static circle
          .fill(.accent)
          .frame(width: 54, height: 54)

        Circle() // circle for animation
          .stroke(Color.accent, lineWidth: 2)
          .frame(width: 52, height: 52)
          .scaleEffect( 1 + CGFloat(animation)) // scale increase
          .opacity( 1 - animation) // opacity reduction
        
        Image(location.image)
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48)
          .clipShape(.circle)
      } //: ZSTACK
      .onAppear {
        withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
          animation = 1
        }
      }
    }
}

#Preview {
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  MapAnnotationView(location: locations[0])
}
