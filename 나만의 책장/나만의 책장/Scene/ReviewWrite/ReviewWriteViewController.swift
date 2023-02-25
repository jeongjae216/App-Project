//
//  ReviewWriteViewController.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/25.
//

import UIKit
import SnapKit

//MARK: - ReviewWriteViewController Class
final class ReviewWriteViewController: UIViewController {
    
    
    //프로퍼티
    lazy var presenter = ReviewWritePresenter(viewController: self)
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
    }
    
    
}

//MARK: - ReviewWriteViewController Extension
extension ReviewWriteViewController: ReviewWriteProtocol {
    
    
    //네비게이션 컨트롤러 셋업
    func setupNavigationBar() {
        //네비게이션 좌측 버튼
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(self.didTapLeftBarButtonItem)
        )
        self.navigationItem.leftBarButtonItem?.tintColor = .systemRed
        
        //네비게이션 우측 버튼
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(self.didTapRightBarButtonItem)
        )
    }
    
    //경고메세지 셋업
    func showCloseAlertSheet() {
        //경고창
        let alertController = UIAlertController(
            title: "작성 중인 내용이 삭제됩니다. 정말 닫으시겠습니까?",
            message: nil,
            preferredStyle: .alert
        )
        //삭제 액션
        let deleteAction = UIAlertAction(
            title: "삭제",
            style: .destructive) { [weak self] _ in
                self?.dismiss(animated: true)
            }
        //취소 액션
        let cancelAction = UIAlertAction(
            title: "취소",
            style: .cancel
        )
        //경고창에 액션 추가
        [deleteAction, cancelAction].forEach { action in
            alertController.addAction(action)
        }
        //경고창 띄우기
        self.present(
            alertController,
            animated: true
        )
    }
    
    func save() {
        self.dismiss(animated: true)
    }
    
    
}

//MARK: - ReviewWriteViewController Extension
extension ReviewWriteViewController {
    
    
    //네비게이션 좌측 버튼이 눌렸을 때
    @objc func didTapLeftBarButtonItem() {
        self.presenter.didTapLeftBarButtonItem()
    }
    
    //네비게이션 우측 버튼이 눌렸을 때
    @objc func didTapRightBarButtonItem() {
        self.presenter.didTapRightBarButtonItem()
    }
    
    
}
