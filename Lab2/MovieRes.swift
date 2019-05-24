//
//  MovieRes.swift
//  Lab2	
//
//  Created by Viachaslau on 5/24/19.
//  Copyright © 2019 tresdosdos. All rights reserved.
//

import Foundation

struct MovieRes : Codable {
    var Response: String?
    var Search: [Movie]?
    var totalResults: String?

}
