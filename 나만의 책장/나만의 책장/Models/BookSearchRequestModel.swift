//
//  BookSearchRequestModel.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/28.
//

import Foundation

//MARK: - BookSearchRequestModel Struct
struct BookSearchRequestModel: Codable {
    
    
    ///검색 할 책 키워드
    let query: String
    
    
}
