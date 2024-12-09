//
//  GalleryView.swift
//  Africa
//
//  Created by Anthony on 21/10/24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES

  @State private var selectedAnimal: String = "lion"
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

// SIMPLE GRID
//  let gridLayout: [GridItem] = [
//    GridItem(.flexible()),
//    GridItem(.flexible()),
//    GridItem(.flexible())
//  ]

  // EFFICIENT GRID
//  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID LAYOUT FOR SLIDER
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0 // holder for number of columns for slider

  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }


    //MARK: - BODY
    var body: some View {
      ScrollView {
        VStack(spacing: 30) {
            //MARK: - IMAGE
          Image(selectedAnimal)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
              Circle().stroke(Color.white, lineWidth: 6)
            }

            //MARK: - SLIDER
          Slider(value: $gridColumn, in: 2...4, step: 1)
            .padding(.horizontal, 16)
            .onChange(of: gridColumn) {
              withAnimation(.easeIn) {
                gridSwitch()
              }
            } // slider changes value in gridColumn which starts function gridSwitch

            //MARK: - GRID
          VStack(alignment: .center, spacing: 30) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { item in
                Image(item.image)
                  .resizable()
                  .scaledToFit()
                  .clipShape(Circle())
                  .overlay(
                    Circle().stroke(Color.white, lineWidth: 2)
                  )
                  .onTapGesture {
                    selectedAnimal = item.image
                    hapticImpact.impactOccurred()
                  }
              } //:  LOOP
            } //: GRID
//            .animation(.easeIn)
            .onAppear {
              gridSwitch()
            }
          } //: VSTACK
        }//: VSTACK
        .padding(.horizontal, 10)
        .padding(.vertical, 50)
      } //: SCROLL
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
