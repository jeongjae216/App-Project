//
//  SearchBookPresenter.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/27.
//

import UIKit

//MARK: - SearchBook Protocol
protocol SearchBookProtocol {
    func setupViews()
    func dismiss()
}

//MARK: - SearchBookPresenter Class
final class SearchBookPresenter: NSObject {
    
    
    //프로퍼티
    private let viewController: SearchBookProtocol
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
    
    //뷰가 생성되었을 때 호출되는 함수
    func viewDidLoad() {
        self.viewController.setupViews()
    }
    
    
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UISearchBarDelegate {
    
    
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewController.dismiss()
    }
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    
}
