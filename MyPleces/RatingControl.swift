//
//  RatingControl.swift
//  MyPleces
//
//  Created by Никита Коголенок on 10/15/20.
//  Copyright © 2020 Никита Коголенок. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // MARK: - Properties
    var rating = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    private var ratingButton = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // MARK: - Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButton.firstIndex(of: button) else { return }
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    // MARK: - Private Methods
    private func setupButton() {
        
        for button in ratingButton {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        // Load button image
        let bondle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bondle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bondle, compatibleWith: self.traitCollection )
        let highlighttedStar = UIImage(named: "highlighttedStar", in: bondle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlighttedStar, for: .highlighted)
            button.setImage(highlighttedStar, for: [.highlighted, .selected])
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            // Add the buttom acction
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            // Add the button to the stack
            addArrangedSubview(button)
            // Add the new button on the rating button array
            ratingButton.append(button)
        }
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        for (index, button) in ratingButton.enumerated() {
            button.isSelected = index < rating
        }
    }
}
