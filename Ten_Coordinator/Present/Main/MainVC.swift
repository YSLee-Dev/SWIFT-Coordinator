//
//  MainVC.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

class MainVC : UIViewController{
    lazy var detailBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("PUSH DETAILVC", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.detailBtnTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    var delegate : MainVCProtocol?
    
    override func viewDidLoad() {
        self.layout()
        self.attribute()
    }
    
    deinit{
        print("DEINIT MAINVC")
    }
}

extension MainVC{
    private func attribute(){
        self.view.backgroundColor = .systemBlue
    }
    
    private func layout(){
        self.view.addSubview(self.detailBtn)
        NSLayoutConstraint.activate([
            self.detailBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.detailBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func detailBtnTap(_ sender:Any){
        self.delegate?.detailBtnClick()
    }
    
}
