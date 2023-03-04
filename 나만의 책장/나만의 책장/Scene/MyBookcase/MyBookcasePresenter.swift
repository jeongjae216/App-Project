//
//  MyBookcasePresenter.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import Foundation
import UIKit
import Kingfisher

//MARK: - MyBookcase Protocol
protocol MyBookcaseProtocol {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

//MARK: - MyBookcasePresenter Class
final class MyBookcasePresenter: NSObject {
    
    
    //프로퍼티
    private let viewController: MyBookcaseProtocol
    private let userDefaultsManager = UserDefaultsManager()
    
    private var review: [BookReview] = []
    
    init(viewController: MyBookcaseProtocol) {
        self.viewController = viewController
    }
    
    //뷰가 생성될 때 호출될 함수
    func viewDidLoad() {
        self.viewController.setupNavigationBar()
        self.viewController.setupViews()
    }
    
    //뷰가 다시 나타날 때 호출되는 함수
    func viewWillAppear() {
        self.review = self.userDefaultsManager.getReviews()
        self.viewController.reloadTableView()
    }
    
    //뷰 컨트롤러에서 didTapRightBarButtonItem() 호출 됐을 때
    func didTapRightBarButtonItem() {
        self.viewController.presentToReviewWriteViewController()
    }
    
    
}

//MARK: - MyBookcasePresenter Extension
extension MyBookcasePresenter: UITableViewDataSource {
    
    
    //행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.review.count
    }
    
    //셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(
            with: review.imageURL,
            placeholder: .none,
            completionHandler: {_ in
                cell.setNeedsLayout()
            }
        )
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
