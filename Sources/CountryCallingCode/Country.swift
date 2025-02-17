//
//  Country.swift
//  CountryCallingCode
//
//  Created by Mohamed Mostafa on 17/02/2025.
//


import Foundation

public struct Country: Codable {
    public struct Name: Codable {
        let arabic: String
        let english: String
    }

    public let name: Name
    public let code: String
    public let callingCode: String
    public let flag: String
}

struct CountriesData: Codable {
    let countries: [Country]
}
