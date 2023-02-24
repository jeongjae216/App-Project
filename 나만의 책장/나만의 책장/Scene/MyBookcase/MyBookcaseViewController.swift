//
//  MyBookcaseViewController.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import UIKit
import SnapKit

//MARK: - MyBookcaseViewController Class
final class MyBookcaseViewController: UIViewController {

    
    //프로퍼티
    private lazy var presenter = MyBookcasePresenter(viewController: self)
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = self.presenter
        
        return tableView
    }()
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
    }
    
    
}

//MARK: - MyBookcaseViewController Extension
extension MyBookcaseViewController: MyBookcaseProtocol {
    
    
    //네비게이션 컨트롤러 셋업
    func setupNavigationBar() {
        //네비게이션 타이틀
        self.navigationItem.title = "나만의 책장"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //네비게이션 우측 바 버튼 아이템
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    //뷰 컨트롤러  셋업
    func setupViews() {
        //테이블 뷰 삽입
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}
