//
//  UserDefaultsManager.swift
//  나만의 책장
//
//  Created by 정재 on 2023/03/03.
//

import Foundation


protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReview]
    func setReview(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    
    
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: BookReview) {
        var currentReviews: [BookReview] = getReviews()
        currentReviews.insert(newValue, at: 0)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
    }
    
    
}
