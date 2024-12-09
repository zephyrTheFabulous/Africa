//
//  CenterModifier.swift
//  Africa
//
//  Created by Anthony on 24/10/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
