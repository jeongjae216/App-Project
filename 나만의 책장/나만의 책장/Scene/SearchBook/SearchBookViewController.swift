//
//  SearchBookViewController.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/27.
//

import UIKit
import SnapKit

//MARK: - SearchBookViewController Class
final class SearchBookViewController: UIViewController {
    
    
    //프로퍼티
    private lazy var presenter = SearchBookPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self.presenter
        tableView.dataSource = self.presenter
        
        return tableView
    }()
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
    }
    
    
}

//MARK: - SearchBookViewController Extension
extension SearchBookViewController: SearchBookProtocol {
    
    
    //뷰 컨트롤러 셋업
    func setupViews() {
        self.view.backgroundColor = .systemBackground
        
        //서치 바
        let searchController = UISearchController()
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self.presenter
        
        self.navigationItem.searchController = searchController
        
        //테이블 뷰 LayOut
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //책 검색 결과가 눌렸을 때
    func dismiss() {
        self.dismiss(animated: true)
    }
    
    
}
