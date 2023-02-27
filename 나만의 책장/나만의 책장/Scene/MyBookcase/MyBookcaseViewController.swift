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
    
    //뷰가 다시 나타날 때
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.viewWillAppear()
    }
    
    
}

//MARK: - MyBookcaseViewController Extension
extension MyBookcaseViewController: MyBookcaseProtocol {
    
    
    //네비게이션 컨트롤러 셋업
    func setupNavigationBar() {
        //네비게이션 타이틀
        self.navigationItem.title = "나만의 책장"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //네비게이션 우측 버튼
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(self.didTapRightBarButtonItem)
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
    
    //ReviewWrite 뷰 컨트롤러 화면 띄우기
    func presentToReviewWriteViewController() {
        let viewController = UINavigationController(rootViewController: ReviewWriteViewController())
        
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    //테이블 뷰 Reload
    func reloadTableView() {
        self.tableView.reloadData()
        
        print("reload")
    }
    
    
}

//MARK: - MyBookcaseViewController Extension
private extension MyBookcaseViewController {
    
    
    //네비게이션 우측 버튼이 눌렸을 때
    @objc func didTapRightBarButtonItem() {
        self.presenter.didTapRightBarButtonItem()
    }
    
    
}
