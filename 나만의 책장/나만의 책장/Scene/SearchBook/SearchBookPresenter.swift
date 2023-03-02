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
    func reloadView()
}

//MARK: - SearchBookDelegate Protocol
protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

//MARK: - SearchBookPresenter Class
final class SearchBookPresenter: NSObject {
    
    
    //프로퍼티
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    
    private let delegate: SearchBookDelegate
    
    private var books: [Book] = []
    
    init(
        viewController: SearchBookProtocol,
        delegate: SearchBookDelegate
    ) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    //뷰가 생성되었을 때 호출되는 함수
    func viewDidLoad() {
        self.viewController.setupViews()
    }
    
    
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        bookSearchManager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = self.books[indexPath.row]
        self.delegate.selectBook(selectedBook)
        
        self.viewController.dismiss()
    }
}

//MARK: - SearchBookPresenter Extension
extension SearchBookPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = self.books[indexPath.row].title
        
        return cell
    }
    
    
}
