//
//  HeroHeaderUIView.swift
//  MovieHunt
//
//  Created by Matias Martinelli on 28/10/2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    private let playButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5

        
        return button
    }()
    
    
    //Implement an ImageView that will contain the image
    private let heroImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    //Function that give the banishing effect to the hero
    private func addGradient() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.locations = [0.5, 1]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        
    }
    
    //Give a frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImage)
        addGradient()
        
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        //Set the contraints
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        //Activate the constraints
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return} // Set the url

        heroImage.sd_setImage(with: url, completed: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImage.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
