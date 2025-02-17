# CountriesCallingCode Swift Package

**CountriesCallingCode** is a Swift package that helps you retrieve detailed information about countries around the world. It provides data in both Arabic and English, including the country's name, code, calling code, and flag. It also offers search functionality based on these attributes.

## Features

- Get country names in **Arabic** and **English**.
- Access the **country code**, **calling code**, and **flag**.
- **Search** countries by name (in Arabic or English), code, calling code, or flag.

## Installation

You can integrate this package into your project using **Swift Package Manager**.

1. Open your project in **Xcode**.
2. Go to **File** > **Add Packages…**.
3. Enter the URL of this repository.
4. Choose the version you'd like to install (e.g., "Up to Next Major Version").
5. Xcode will fetch and integrate the package into your project.

## Usage

### Initialize the CountriesProvider

To start using the package, first initialize the `CountriesProvider`:

```swift
import CountriesProvider

let provider = CountriesProvider()
```
## Searching Countries
#### You can get an array of all countries:
```swift
let countries = provider.countries
```

You can search countries using the following methods:

#### Search by Name (Arabic or English)
```swift
if let results = provider.fetch(name: "Egypt") {
    // This will return an array that will have Egypt country data.
}
```
Searchig in arabic will get you the same results.
```swift
if let results = provider.fetch(name: "مصر") {
    // This will return an array that will have Egypt country data.
}
```

#### Search by Country Code
```swift
if let results = provider.fetch(code: "EG") {
    // Handle the list of countries contains the code "EG"
}
```

#### Search by Calling Code
```swift
if let results = provider.fetch(callingCode: "+1") {
    // Handle the list of countries that contains +1" in theire calling code
}
```

#### Search by flag
```swift
if let results = provider.fetch(flag: "🇺🇸") {
    // Handle the list of countries matching the flag "🇺🇸"
}
```
## Usage example
```swift
struct ContentView: View {
    @State private var searchQuery = ""
    @State private var searchResults: [Country] = []
    
    private let provider = CountriesProvider()

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                TextField("Search for a country", text: $searchQuery, onCommit: searchCountries)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // List of search results
                List(searchResults, id: \.code) { country in
                    VStack(alignment: .leading) {
                        Text(country.name.english)
                            .font(.headline)
                        Text(country.name.arabic)
                            .font(.subheadline)
                        Text("Code: \(country.code)")
                            .font(.subheadline)
                        Text("Calling Code: \(country.callingCode)")
                            .font(.subheadline)
                        Text("Flag: \(country.flag)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Country Search")
            .onAppear{
                searchResults = provider.countries ?? []
            }
        }
        .padding()
    }
    // Search function that updates searchResults based on the query
    private func searchCountries() {
        // Reset search results
        searchResults = []

        // Search by name (in Arabic or English)
        if let results = provider.fetch(name: searchQuery) {
            searchResults.append(contentsOf: results)
        }
    }
}
```

## Contribution
Feel free to play with it and enhance some functionalities and create your pull request.

