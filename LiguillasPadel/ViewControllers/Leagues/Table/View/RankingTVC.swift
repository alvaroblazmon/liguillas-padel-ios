//
//  RankingTVC.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez Montero on 2/9/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class RankingTVC: UITableViewCell {
    
    static let XibName = "RankingTVC"
    static let ReuseIdentifier = "Ranking"

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var gamesWinnersLabel: UILabel!
    @IBOutlet weak var gamesLosersLabel: UILabel!
    @IBOutlet weak var setWinnersLabel: UILabel!
    @IBOutlet weak var setLosersLabel: UILabel!
    
    var itemVM: RankingItemVM? {
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
            fatalError("BindViewModel does not has Model")
        }
        
        positionLabel.text = String(itemVM.position)
        nameLabel.text = itemVM.name
        pointsLabel.text = String(itemVM.points)
        gamesPlayedLabel.text = String(itemVM.played)
        gamesWinnersLabel.text = String(itemVM.matchsWinner)
        gamesLosersLabel.text = String(itemVM.matchsLoser)
        setWinnersLabel.text = String(itemVM.setsLoser)
        setLosersLabel.text = String(itemVM.setsLoser)
        
    }
    
}
