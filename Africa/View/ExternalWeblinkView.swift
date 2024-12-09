//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTIES

  let animal: Animal

    //MARK: - BODY
    var body: some View {
      GroupBox {
        HStack {
          Image(systemName: "globe")
          Text("Wikipedia")
          Spacer()

          Group {
            Link(animal.name,
                 destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)

            Image(systemName: "arrow.up.right.square")
          }
          .foregroundStyle(.accent)
        } //: HSTACK
      } //: BOX
    }
}

#Preview {
  let animals: [Animal] = Bundle.main.decode("animals.json") // for preview purposes
  ExternalWeblinkView(animal: animals[0])
}
