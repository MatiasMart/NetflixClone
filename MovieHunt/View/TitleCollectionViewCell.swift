//
//  TitleCollectionViewCell.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 08/11/2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    // Create an imageView for the posters
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
        
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bou nds
    }
    
    //Each time we deque a cell we need to have an update function
    //so we can update the poster for each cell
    
    public func configure(with model: String) {
        guard let url = URL(string: model) {return}
        posterImageView.sd_setImage(with: url , completed: nil)
    }
    
}
    

