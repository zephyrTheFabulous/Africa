//
//  InsetFactView.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - PROPERTIES

  let animal: Animal

    //MARK: - BODY
    var body: some View {
      GroupBox {
        TabView {
          ForEach(animal.fact, id: \.self) { item in
            Text(item)
          }
        } //: TAB
        .tabViewStyle(.page)
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180) // flexible height
      } //: BOX
    }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview purposes
  InsetFactView(animal: animals[0])
}
