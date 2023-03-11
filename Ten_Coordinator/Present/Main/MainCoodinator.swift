//
//  MainCoodinator.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

class MainCoodinator : Coordinator{
    var navi: UINavigationController
    var childCoordinators: [Coordinator]
    
    var delegate : MainCoordinatorProtocol?
    
    init(navi: UINavigationController) {
        self.navi = navi
        self.childCoordinators = []
    }
    
    deinit{
        print("DEINIT MAINCOORDINATOR")
    }
    
    func start() {
        let main = MainVC()
        main.delegate = self
        self.navi.viewControllers = [main]
    }
}

extension MainCoodinator : MainVCProtocol{
    func detailBtnClick() {
        self.delegate?.detailPush(self)
    }
}
