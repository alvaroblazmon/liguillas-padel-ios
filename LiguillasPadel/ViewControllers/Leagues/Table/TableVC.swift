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
        
        let headerNib = UINib.init(nibName: TableHFV.XibName, bundle: nil)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: TableHFV.ReuseIdentifier)
    }

}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHFV.ReuseIdentifier) as? TableHFV else {
            fatalError("The dequeued cell is not an instance of TableHFV.")
        }
        let backgroundView = UIView(frame: headerView.bounds)
        backgroundView.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        headerView.backgroundView = backgroundView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTVC.ReuseIdentifier, for: indexPath) as? RankingTVC  else {
            fatalError("The dequeued cell is not an instance of RankingTVC.")
        }
        
        cell.itemVM = viewModel.itemAtIndex(indexPath.row)
        
        return cell
    }
    
}
