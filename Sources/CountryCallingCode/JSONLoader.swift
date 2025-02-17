//
//  JSONLoader.swift
//  CountryCallingCode
//
//  Created by Mohamed Mostafa on 17/02/2025.
//


import Foundation

class JSONLoader {
    static func loadCountries() -> [Country]? {
        // 1. Get the URL of the JSON file
        guard let url = Bundle.module.url(forResource: "Countries", withExtension: "json") else {
            print("Failed to locate JSON file.")
            return nil
        }

        do {
            // 2. Load the JSON data
            let data = try Data(contentsOf: url)

            // 3. Parse the JSON data into the data model
            let decoder = JSONDecoder()
            let countriesData = try decoder.decode(CountriesData.self, from: data)

            // 4. Return the array of countries
            return countriesData.countries
        } catch {
            print("Failed to load or parse JSON: \(error)")
            return nil
        }
    }
}
