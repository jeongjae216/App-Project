//
//  ReviewWritePresenter.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/25.
//

import UIKit

//MARK: - ReviewWrite Protocol
protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertSheet()
    func save()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
    
}

//MARK: - ReviewWritePresenter Class
final class ReviewWritePresenter: NSObject {
    
    
    //프로퍼티
    private let viewController: ReviewWriteProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var book: Book?
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    //뷰가 생성되었을 때 호출될 함수
    func viewDidLoad() {
        self.viewController.setupNavigationBar()
        self.viewController.setupViews()
    }
    
    //뷰 컨트롤러에서 didTapLeftBarButtonItem()이 호출 되었을 때
    func didTapLeftBarButtonItem() {
        self.viewController.showCloseAlertSheet()
    }
    
    //뷰 컨트롤러에서 didTapRightBarButtonItem()이 호출 되었을 때
    func didTapRightBarButtonItem(contentsText: String?) {
        guard let book = book else { return }
        
        let bookReview = BookReview(
            title: book.title,
            contents: contentsText ?? "",
            imageURL: book.imgURL
        )
        self.userDefaultsManager.setReview(bookReview)
        self.viewController.save()
    }
    
    //뷰 컨트롤러에서 didTapBookTitleButton()이 호출 되었을 때
    func didTapBookTitleButton() {
        self.viewController.presentToSearchBookViewController()
    }
    
    
}

//MARK: - ReviewWritePresenter Extension
extension ReviewWritePresenter: SearchBookDelegate {
    
    
    func selectBook(_ book: Book) {
        self.book = book
        
        self.viewController.updateViews(title: book.title, imageURL: book.imgURL)
    }
    
    
}
