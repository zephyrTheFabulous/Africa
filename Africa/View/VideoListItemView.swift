//
//  VideoListItem.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES

  let video: Video

    //MARK: - BODY
    var body: some View {
      HStack(spacing: 10) {
        ZStack {
          Image(video.thumbnail) // comp.property shortcut is in VideoModel
            .resizable()
            .scaledToFit()
            .frame(height: 80)
            .clipShape(.rect(cornerRadius: 8))
          Image(systemName: "play.circle")
            .resizable()
            .scaledToFit()
            .frame(height: 32)
            .shadow(radius: 4)
        } //: ZSTACK
        VStack(alignment: .leading, spacing: 10) {
          Text(video.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(.accent)
          Text(video.headline)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
        } //: VSTACK
      } //: HSTACK
    }
}

#Preview {
  let videos: [Video] = Bundle.main.decode("videos.json") // for preview purposes
  VideoListItemView(video: videos[0])
}
