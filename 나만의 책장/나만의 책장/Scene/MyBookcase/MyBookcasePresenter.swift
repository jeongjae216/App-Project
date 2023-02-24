//
//  MyBookcasePresenter.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import Foundation
import UIKit

//MARK: - MyBookcase Protocol
protocol MyBookcaseProtocol {
    func setupNavigationBar()
    func setupViews()
}

//MARK: - MyBookcasePresenter Class
final class MyBookcasePresenter: NSObject {
    
    
    //프로퍼티
    private let viewController: MyBookcaseProtocol
    init(viewController: MyBookcaseProtocol) {
        self.viewController = viewController
    }
    
    //뷰가 생성될 때 호출될 함수
    func viewDidLoad() {
        self.viewController.setupNavigationBar()
        self.viewController.setupViews()
    }
    
    
}

//MARK: - MyBookcasePresenter Extension
extension MyBookcasePresenter: UITableViewDataSource {
    
    
    //행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
    
    
}
