//
//  Coordinator.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

protocol Coordinator : AnyObject{
    var childCoordinators : [Coordinator] {get set}
    var navi : UINavigationController {get set}
    func start()
}
