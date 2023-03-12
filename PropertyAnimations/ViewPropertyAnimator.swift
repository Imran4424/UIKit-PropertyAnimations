//
//  ViewPropertyAnimator.swift
//  PropertyAnimations
//
//  Created by Shah Md Imran Hossain on 2/3/23.
//

import UIKit

class ViewPropertyAnimator: UIViewController {
    let slider = UISlider()
    let animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
    var imageView = UIImageView(image: UIImage(named: "himalaya"))
    var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        
        imageView.frame = view.frame
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        blurView.frame = view.frame
        blurView.alpha = 0.1
        view.addSubview(blurView)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
    }
    
    private func layoutViews() {
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        slider.addTarget(self, action: #selector(handleSliderChanged), for: .allEvents)
    }
}

// MARK: - Actions
extension ViewPropertyAnimator {
    @objc private func handleSliderChanged() {
        animator.fractionComplete = CGFloat(slider.value)
    }
}
