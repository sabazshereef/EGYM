//
//  ModelClass.swift
//  EGYM
//
//  Created by sabaz shereef on 19/06/21.
//

import Foundation



import Foundation

// MARK: - APiResponse
struct ApiResponse: Codable {
    let  copyright: String
    let results: [ResultApi]

    enum CodingKeys: String, CodingKey {
        case  copyright
        case results
    }
}


struct ResultApi: Codable {
    let section, subsection, title, abstract: String
    let url: String
    let uri, byline: String
    let itemType: ItemType
    let materialTypeFacet, kicker: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let multimedia: [Multimedia]?
    let shortURL: String

    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case materialTypeFacet = "material_type_facet"
        case kicker
         case desFacet = "des_facet"
         case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
       case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: Type
    let subtype: Subtype
    let caption, copyright: String
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum Type: String, Codable {
    case image = "image"
}

