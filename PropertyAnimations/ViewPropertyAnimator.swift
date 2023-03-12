//
//  ViewPropertyAnimator.swift
//  PropertyAnimations
//
//  Created by Shah Md Imran Hossain on 2/3/23.
//

import UIKit

class ViewPropertyAnimator: UIViewController {
    let slider = UISlider()
    var animator: UIViewPropertyAnimator!
    let box = UIView()
    var boxWidthAnchor: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        
//        animator.addAnimations {
//            self.view.backgroundColor = .white
//            self.box.backgroundColor = .blue
//            self.view.layoutIfNeeded()
//        }
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .green
        view.addSubview(box)
    }
    
    private func layoutViews() {
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        slider.addTarget(self, action: #selector(handleSliderChanged), for: .allEvents)
        
        boxWidthAnchor = box.widthAnchor.constraint(equalToConstant: 100)
        boxWidthAnchor.isActive = true
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

// MARK: - Actions
extension ViewPropertyAnimator {
    @objc private func handleSliderChanged() {
        boxWidthAnchor.constant = 100 + CGFloat((slider.value * 100))
//        animator.fractionComplete = CGFloat(slider.value)
        animator = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5, animations: {
            self.box.backgroundColor = .blue
            self.view.backgroundColor = .white
            self.view.layoutIfNeeded()
        })
        animator.startAnimation()
    }
}
