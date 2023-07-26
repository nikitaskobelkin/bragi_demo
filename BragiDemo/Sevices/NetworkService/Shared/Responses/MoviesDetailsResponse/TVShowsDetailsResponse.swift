//
//  TVShowsDetailsResponse.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import Foundation

struct TVShowsDetailsResponse: Codable {
    let lastAirDate: String?
    let lastEpisodeToAir: EpisodeToAir?

    enum CodingKeys: String, CodingKey {
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        }
}

struct EpisodeToAir: Codable {
    let name: String?
}
