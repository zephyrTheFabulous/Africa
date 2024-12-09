  //
  //  ContentView.swift
  //  Africa
  //
  //  Created by Anthony on 21/10/24.
  //

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES

  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)

  @State private var isGridViewActive: Bool = false

  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"

    //MARK: - FUNCTIONS
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count

    // TOOLBAR IMAGE
    switch gridColumn { // for button image change
    case 1: toolbarIcon = "square.grid.2x2"
    case 2: toolbarIcon = "square.grid.3x2"
    case 3: toolbarIcon = "rectangle.grid.1x2"
    default: toolbarIcon = "square.grid.2x2"
    }
  }

    //MARK: - BODY
  var body: some View {
    NavigationStack {
      Group {
        if !isGridViewActive { // list layout is default
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(.zero))

            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            } //: LOOP

              CreditsView().modifier(CenterModifier())

          } //: LIST
        } else {
          ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }
              } //: LOOP
            } //: GRID
            .padding(10)
//            .animation(.easeIn)
          } //: SCROLL
        } //: CONDITION
      }
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          HStack(alignment: .center, spacing: 16) {
              // LIST BUTTON
            Button {
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundStyle(isGridViewActive ? .primary : Color.accent)
            }

              // GRID BUTTON
            Button {
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            } label: {
              Image(systemName: toolbarIcon) // property that changes from FUNCTIONS
                .font(.title2)
                .foregroundStyle(isGridViewActive ? .accent : .primary)
            }


          }
        }
      } //: TOOLBAR
    } //: NAVIGATION
  }
}

#Preview {
  ContentView()
}
