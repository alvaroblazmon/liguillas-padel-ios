//
//  MatchTVC.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 29/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import UIKit

class MatchTVC: UITableViewCell {
    
    static let XibName = "MatchTVC"
    static let ReuseIdentifier = "Match"

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstHomeImage: UIImageView!
    @IBOutlet weak var secondHomeImage: UIImageView!
    @IBOutlet weak var firstAwayImage: UIImageView!
    @IBOutlet weak var secondAwayImage: UIImageView!
    
    @IBOutlet weak var firstHomeLabel: UILabel!
    @IBOutlet weak var secondHomeLabel: UILabel!
    @IBOutlet weak var firstAwayLabel: UILabel!
    @IBOutlet weak var secondAwayLabel: UILabel!
    
    var itemVM: MatchItemVM? {
        didSet {
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func bindViewModel() {
        guard let itemVM = itemVM else {
            fatalError("BindViewModel does not has Model - FilterDetailVM")
        }
        
        firstHomeLabel.text = itemVM.firstNameHome
        secondHomeLabel.text = itemVM.secondNameHome
        firstAwayLabel.text = itemVM.firstNameAway
        secondAwayLabel.text = itemVM.secondNameAway
        resultLabel.text = itemVM.result
        
    }
    
}
