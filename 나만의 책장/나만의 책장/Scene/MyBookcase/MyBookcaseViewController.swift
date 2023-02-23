//
//  MyBookcaseViewController.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import UIKit

class MyBookcaseViewController: UIViewController {

    
    private lazy var presenter = MyBookcasePresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

extension MyBookcaseViewController: MyBookcaseProtocol {
    
}
