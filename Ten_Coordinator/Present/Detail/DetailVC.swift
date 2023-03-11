//
//  DetailVC.swift
//  Ten_Coordinator
//
//  Created by 이윤수 on 2023/03/11.
//

import UIKit

class DetailVC : UIViewController{
    lazy var backBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("BACK", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.backbtnTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    var delegate : DetailVCProtocol?
    
    override func viewDidLoad() {
        self.layout()
        self.attribute()
    }
    
    deinit{
        print("DEINIT DETAILVC")
    }
}

extension DetailVC{
    private func attribute(){
        self.view.backgroundColor = .systemYellow
    }
    
    private func layout(){
        self.view.addSubview(self.backBtn)
        NSLayoutConstraint.activate([
            self.backBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.backBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func backbtnTap(_ sender:Any){
        self.delegate?.backBtnTap()
    }
    
}
