//
//  LocalStorageManager.swift
//  MovieCollection
//
//  Created by Min Ku An on 2022-10-27.
//

import Foundation

final class LocalStorageManager {
    
    enum UserDefaultsKey {
        static let myList = "MY_LIST_KEY"
    }
    
    enum LocalStorageManagerResponse {
        case success
        case noDataFound
        case decodeFailed
        case emptyList
        
        var description: String {
            switch self {
            case .success:
                return "Found MyList"
            case .noDataFound:
                return "No Data Found"
            case .decodeFailed:
                return "Decode Failed"
            case .emptyList:
                return "MyList is empty"
            }
        }
    }
    
    static let shared = LocalStorageManager()
    private let userDefaults = UserDefaults.standard
    
    init() {
        
    }
    
    func saveMyList(with myList: [Movie]) { // with -> loadMyList(with: [Movie])
        if let encodedData = try? JSONEncoder().encode(myList) {
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsKey.myList)
        }
    }
    
    func loadMyList(completion: @escaping ([Movie], LocalStorageManagerResponse) -> Void) { // Error?
        guard
            let data = UserDefaults.standard.data(forKey: UserDefaultsKey.myList) else {
            completion([], .noDataFound)
            return
        }
        
        guard let myList = try? JSONDecoder().decode([Movie].self, from: data) else {
//            return (nil, NSError(domain: "Could not Decode the data", code: 122))
            completion([], .decodeFailed)
            return
        }
        
        if myList.isEmpty {
            completion([], .emptyList)
        } else {
            completion(myList, .success)
        }
    }
    
    
    
    
    
}
