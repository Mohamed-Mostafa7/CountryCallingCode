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

    let name: Name
    let code: String
    let callingCode: String
    let flag: String
}

struct CountriesData: Codable {
    let countries: [Country]
}
