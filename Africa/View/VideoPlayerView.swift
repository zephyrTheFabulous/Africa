//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Anthony on 22/10/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - PROPERTIES

  var videoSelected: String
  var videoTitle: String

    //MARK: - BODY
    var body: some View {
      VStack {
        VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//          Text(videoTitle)
        }
        .overlay(alignment: .topLeading){
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(8)
        }
      } //: VSTACK
      .tint(.accent)
      .navigationTitle(videoTitle)
      .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
  NavigationStack {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
  }
}
