//
//  BookReview.swift
//  나만의 책장
//
//  Created by 정재 on 2023/03/03.
//

import Foundation

//MARK: - BookReview Struct
struct BookReview: Codable {
    
    
    let title: String
    let contents: String
    let imageURL: URL?
    
    
}
