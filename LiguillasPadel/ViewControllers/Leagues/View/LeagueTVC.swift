//
//  LeagueTVC.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez Montero on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class LeagueTVC: UITableViewCell {
    
    static let XibName = "LeagueTVC"
    static let ReuseIdentifier = "League"

    var itemVM: LeagueItemVM? {
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
        
        textLabel?.text = itemVM.name
        
    }
    
}
