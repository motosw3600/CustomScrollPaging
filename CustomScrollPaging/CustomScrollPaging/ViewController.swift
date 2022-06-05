//
//  ViewController.swift
//  CustomScrollPaging
//
//  Created by 박상우 on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
}

