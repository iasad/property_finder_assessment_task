//
//  BaseModel.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import Foundation

struct BaseModel: Decodable {
    let total: Int?
    var res: [Re]?
}

struct Re: Decodable {
    let id: Int?
    let update: Int?
    let categoryId: Int?
    let title: String?
    let subject: String?
    let type: String?
    let typeId: Int?
    let thumbnail: String?
    let thumbnailBig: String?
    let imageCount: Int?
    let price: String?
    let pricePeriod: String?
    let pricePeriodRaw: String?
    let priceLabel: String?
    let priceValue: String?
    let priceValueRaw: Int?
    let currency: String?
    let featured: Bool?
    let location: String?
    let area: String?
    let poa: String?
    let reraPermit: String?
    let bathrooms: Int?
    let bedrooms: Int?
    let visited: Bool?
    let dateInsert: Date?
    let dateUpdate: Date?
    let agentName: String?
    let brokerName: String?
    let agentLicense: String?
    let locationId: Int?
    let hideLocation: Bool?
    let broker: Broker?
    let amenities: [String]?
    let amenitiesKeys: [String]?
    let lat: Double?
    let long: Double?
}

struct Broker: Decodable {
    let id: Int?
    let name: String?
    let address: String?
    let phone: String?
    let email: String?
    let mobile: String?
    let agentPhoto: String?
    let agentName: String?
    let leadEmailReceivers: [String]?
    let license: String?
    let agentId: Int?
    let logo: String?
}

