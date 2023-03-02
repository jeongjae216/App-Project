//
//  BookSeachManager.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/28.
//

import Alamofire
import Foundation

//MARK: - BookSearchManager Struct
struct BookSearchManager {
    
    
    func request(from keyword: String, completionHandler: @escaping (([Book]) -> Void)) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = BookSearchRequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "yXLqMBjUCJB_6SWZL4m7",
            "X-Naver-Client-Secret": "5eTFAe9Kj_"
        ]
        
        AF
            .request(
                url,
                method: .get,
                parameters: parameters,
                headers: headers
            )
            .responseDecodable(
                of: BookSearchResponseModel.self) { response in
                    switch response.result {
                    case .success(let result):
                        completionHandler(result.items)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            .resume()
    }
    
    
}
