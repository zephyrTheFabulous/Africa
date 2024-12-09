//
//  CreditsView.swift
//  Africa
//
//  Created by Anthony on 24/10/24.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES



    //MARK: - BODY
    var body: some View {
      VStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 128, height: 128)
        Text("""
  Copyright © Robert Petras
  All right reserved
  Better Apps ♥️ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
      } //: VSTACK
      .padding()
      .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}
