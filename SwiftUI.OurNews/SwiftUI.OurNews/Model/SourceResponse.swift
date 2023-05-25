//
//  SourceResponse.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/22/23.
//

import Foundation

struct SourceResponse: Decodable {
    var status: String
    var sources: [Source]
    
    private enum SourceResponseKeys: String, CodingKey {
        case sourceKey = "sources"
        case statusKey = "status"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SourceResponseKeys.self)
        sources = try container.decode([Source].self, forKey: .sourceKey)
        status = try container.decode(String.self, forKey: .statusKey)
    }
}
