  //
  //  MotionAnimationView.swift
  //  Africa
  //
  //  Created by Anthony on 23/10/24.
  //

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    // как сделать цвет каждого круга разным?

  @State private var randomCircle: Int = Int.random(in: 12...16)
  @State private var isAnimating: Bool = false

    //MARK: - FUNCTIONS

  // 1. RANDOM COORDINATE
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }

  // 2. RANDOM SIZE
  func randomSize() -> CGFloat {
    return CGFloat.random(in: 10...300)
  }

  // 3. RANDOM SCALE
  func randomScale() -> CGFloat {
    return CGFloat.random(in: 0.1...2.0)
  }

    // 4. RANDOM SPEED
  func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }

  // 5. RANDOM DELAY
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

    //MARK: - BODY
  var body: some View {
    GeometryReader { geo in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { item in
          Circle()
            .foregroundStyle(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(
              x: randomCoordinate(max: geo.size.width), // разное значение для координат, но в пределах экрана
              y: randomCoordinate(max: geo.size.height))
            .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
              .repeatForever()
              .speed(randomSpeed())
              .delay(randomDelay()), value: isAnimating)
            .onAppear {
              isAnimating = true
            }
        } //: LOOP
      } //: ZSTACK
      .drawingGroup()
    } //: GEO
  }
}

#Preview {
  MotionAnimationView()
}
