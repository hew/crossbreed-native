//
//  Models.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2019-12-31.
//  Copyright © 2019 Matthew Jones. All rights reserved.
//
    
import SwiftUI

typealias UINetworkModel = Decodable & Identifiable

struct Genetics: Codable {
    let names: [String]
    
    enum GeneticsKeys: String, CodingKey {
        case names
        //            case ucpc
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GeneticsKeys.self)
        do {
            self.names = try container.decode(String.self, forKey: .names).components(separatedBy: " x ")
        } catch DecodingError.typeMismatch {
            self.names = []
        }
    }
    
}

struct Lineage: Codable {
    let afghanistan, southAfrica: String?
    
    enum CodingKeys: String, CodingKey {
        case afghanistan = "Afghanistan"
        case southAfrica = "South Africa"
    }
}

struct SeedCompany: Codable {
    let name, ocpc: String?
}

struct Strain: UINetworkModel {
    let id: UUID
    let ucpc: String
    let name: String
    let genetics: Genetics
    let image: String
    let seedCompany: SeedCompany
    
    // The keys inside of the "user" object
    enum StrainKeys: String, CodingKey {
        case id
        case name
        case ucpc
        case genetics
        case image
        case seedCompany
    }
    
    init(from decoder: Decoder) throws {
        // Extract the top-level values ("user")
        let values = try decoder.container(keyedBy: StrainKeys.self)
        
        // Extract each property from the nested container
        id = UUID()
        ucpc = try values.decode(String.self, forKey: .ucpc)
        name = try values.decode(String.self, forKey: .name)
        genetics = try values.decode(Genetics.self, forKey: .genetics)
        image = try values.decode(String.self, forKey: .image)
        seedCompany = try values.decode(SeedCompany.self, forKey: .seedCompany)
    }
}

typealias Strains = [Strain]

struct RawRequest: Decodable {
    var data: Strains
}




