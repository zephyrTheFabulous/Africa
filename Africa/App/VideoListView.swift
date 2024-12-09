//
//  VideoListView.swift
//  Africa
//
//  Created by Anthony on 21/10/24.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES

  @State var videos: [Video] = Bundle.main.decode("videos.json")

  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    //MARK: - BODY
    var body: some View {
      NavigationStack {
        List(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        } //: LIST
        .listStyle(.insetGrouped)
        .navigationTitle("Videos")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              videos.shuffle()
              hapticImpact.impactOccurred()
            } label: {
              Image(systemName: "arrow.2.squarepath")
            }

          }
        }
      } //: NAVIGATION
    }
}

#Preview {
    VideoListView()
}
