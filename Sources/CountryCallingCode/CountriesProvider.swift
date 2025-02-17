// The Swift Programming Language
// https://docs.swift.org/swift-book

public class CountriesProvider {
    public let countries: [Country]?
    
    public init() {
        self.countries = JSONLoader.loadCountries()
    }
    
    public func fetch(name: String) -> [Country]? {
        return countries?.filter{ $0.name.arabic.localizedCaseInsensitiveContains(name) || $0.name.english.localizedCaseInsensitiveContains(name) }
    }
    
    public func fetch(code: String) -> [Country]? {
        return countries?.filter{ $0.code.localizedCaseInsensitiveContains(code) }
    }
    
    public func fetch(callingCode: String) -> [Country]? {
        return countries?.filter{ $0.callingCode.contains(callingCode) }
    }
    
    public func fetch(flag: String) -> [Country]? {
        return countries?.filter{ $0.flag.contains(flag) }
    }
}

