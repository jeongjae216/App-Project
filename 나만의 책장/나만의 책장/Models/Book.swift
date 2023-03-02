//
//  Book.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/28.
//

import Foundation

//MARK: - Book Struct
struct Book: Decodable {
    
    
    let title: String
    private let image: String?
    let discount: String?
    
    var imgURL: URL? { URL(string: image ?? "") }
    
}
