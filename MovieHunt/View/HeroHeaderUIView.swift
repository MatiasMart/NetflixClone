//
//  HeroHeaderUIView.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 28/10/2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    //Implement an ImageView that will contain the image
    private let heroImage: UIView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Give a frame and asing 3 things
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImage.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
