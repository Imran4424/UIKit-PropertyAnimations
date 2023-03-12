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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        
        animator.addAnimations {
            self.view.backgroundColor = .white
        }
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
    }
    
    private func layoutViews() {
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
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
