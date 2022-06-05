//
//  CollectionViewCell.swift
//  CustomScrollPaging
//
//  Created by 박상우 on 2022/06/05.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Page"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(titleLabel)
        
        backgroundContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
