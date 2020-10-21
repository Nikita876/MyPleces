//
//  CustomTableViewCell.swift
//  MyPleces
//
//  Created by Никита Коголенок on 10/6/20.
//  Copyright © 2020 Никита Коголенок. All rights reserved.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {
    // MARK: - Outlet
    @IBOutlet weak var imageOfPlace: UIImageView! {
        didSet {
            imageOfPlace?.layer.cornerRadius = imageOfPlace.frame.size.height / 2
            imageOfPlace?.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lacationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
}
