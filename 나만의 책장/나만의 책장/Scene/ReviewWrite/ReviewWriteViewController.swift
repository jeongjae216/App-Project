//
//  ReviewWriteViewController.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/25.
//

import UIKit
import SnapKit
import Kingfisher

//MARK: - ReviewWriteViewController Class
final class ReviewWriteViewController: UIViewController {
    
    
    //프로퍼티
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.addTarget(
            self,
            action: #selector(self.didTapBookTitleButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        
        textView.text = "입력해주세요."
        textView.textColor = .tertiaryLabel
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        
        textView.delegate = self
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
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
    
    //내용 저장하기
    func save() {
        self.dismiss(animated: true)
    }
    
    //뷰 컨트롤러 셋업
    func setupViews() {
        self.view.backgroundColor = .systemBackground
        
        [self.bookTitleButton, self.contentsTextView, self.imageView] .forEach {
            self.view.addSubview($0)
        }
        //책 제목 버튼 LayOut
        self.bookTitleButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(20)
        }
        //리뷰 작성 텍스트 뷰 LayOut
        self.contentsTextView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(self.bookTitleButton.snp.bottom).offset(16)
        }
        //이미지 뷰 LayOut
        self.imageView.snp.makeConstraints {
            $0.leading.equalTo(self.contentsTextView.snp.leading)
            $0.trailing.equalTo(self.contentsTextView.snp.trailing)
            $0.top.equalTo(self.contentsTextView.snp.bottom).offset(16)
            $0.height.equalTo(200)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    //SearchBook 뷰 컨트롤러 화면 띄우기
    func presentToSearchBookViewController() {
        let viewController = UINavigationController(
            rootViewController: SearchBookViewController(searchBookDelegate: self.presenter)
        )
        
        self.present(viewController, animated: true)
    }
    
    //View 업 데이트 하기
    func updateViews(title: String, imageURL: URL?) {
        self.bookTitleButton.setTitle(title, for: .normal)
        self.bookTitleButton.setTitleColor(.label, for: .normal)
        self.imageView.kf.setImage(with: imageURL)
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
    
    //책 제목 버튼이 눌렸을 때
    @objc func didTapBookTitleButton() {
        self.presenter.didTapBookTitleButton()
    }
    
    
}

//MARK: - ReviewWriteViewController Extension
extension ReviewWriteViewController: UITextViewDelegate {
    
    
    //텍스트 뷰가 눌렸을 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else {
            return
        }
        textView.text = nil
        textView.textColor = .label
    }
    
    
}
