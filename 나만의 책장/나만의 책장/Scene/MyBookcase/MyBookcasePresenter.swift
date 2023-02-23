//
//  MyBookcasePresenter.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import Foundation
import UIKit

protocol MyBookcaseProtocol {}

final class MyBookcasePresenter {
    
    
    private let viewController: MyBookcaseProtocol
    
    init(viewController: MyBookcaseProtocol) {
        self.viewController = viewController
    }
    
    
}
