//
//  AppCoordinator.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

class AppCoordinator : Coordinator{
    var childCoordinators: [Coordinator] = []{
        didSet{
            print(self.childCoordinators)
        }
    }
    var navi : UINavigationController
    
    init(navi: UINavigationController) {
        self.navi = navi
    }
    
    func start() {
        let mainCoordinator = MainCoodinator(navi: self.navi)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        self.childCoordinators.append(mainCoordinator)
    }
    
    func detailVCPush(){
        let detail = DetailCoordinator(navi: self.navi)
        detail.delegate = self
        detail.start()
        self.childCoordinators.append(detail)
    }
}

extension AppCoordinator : MainCoordinatorProtocol, DetailCoordinatorProtocol{
    func detailPush(_ coordinator: MainCoodinator) {
        self.childCoordinators = self.childCoordinators.filter{$0 !== coordinator}
        self.detailVCPush()
    }
    
    func mainPop(_ coordinator: DetailCoordinator) {
        self.childCoordinators = self.childCoordinators.filter{$0 !== coordinator}
        self.start()
    }
}
