//
//  DetailCoordinator.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

class DetailCoordinator : Coordinator{
    var childCoordinators: [Coordinator]
    var navi: UINavigationController
    
    var delegate : DetailCoordinatorProtocol?
    
    init(navi: UINavigationController) {
        self.childCoordinators = []
        self.navi = navi
    }
    
    deinit{
        print("DEINIT DETAILCOORDINATOR")
    }
    
    func start() {
        let detail = DetailVC()
        detail.delegate = self
        self.navi.viewControllers = [detail]
    }
}

extension DetailCoordinator : DetailVCProtocol{
    func backBtnTap() {
        self.delegate?.mainPop(self)
    }
}
