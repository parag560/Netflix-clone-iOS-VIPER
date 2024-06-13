//
//  YoutubeSearchResponse.swift
//  Netflix
//
//  Created by MP-44 on 08/06/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
