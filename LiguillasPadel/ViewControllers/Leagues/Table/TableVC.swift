//
//  TableVC.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 6/9/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class TableVC: UIViewController {
    
    var viewModel: TableVM!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Clasificación"
        prepareTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareTableView() {
        let nib = UINib(nibName: RankingTVC.XibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: RankingTVC.ReuseIdentifier)
        tableView.tableFooterView = UIView()
    }

}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTVC.ReuseIdentifier, for: indexPath) as? RankingTVC  else {
            fatalError("The dequeued cell is not an instance of SearchProductTVC.")
        }
        
        cell.itemVM = viewModel.itemAtIndex(indexPath.row)
        
        return cell
    }
    
}
