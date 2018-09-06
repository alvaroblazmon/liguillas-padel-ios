//
//  CalendarVC.swift
//  prueba10
//
//  Created by Alvaro Blazquez on 29/8/18.
//  Copyright © 2018 Alvaro Blazquez. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    
    var viewModel: CalendarVM!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        //navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "outline_looks_one_black_36pt"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(tapLeague))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clasificación", style: UIBarButtonItemStyle.plain, target: self, action: #selector(tapLeague))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.Padel.Purple
        prepareTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareTableView() {
        let nib = UINib(nibName: MatchTVC.XibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MatchTVC.ReuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    @objc func tapLeague() {
        viewModel.goToTable()
    }

}

extension CalendarVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.itemAtIndex(section)?.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemAtIndex(section)?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchTVC.ReuseIdentifier, for: indexPath) as? MatchTVC  else {
            fatalError("The dequeued cell is not an instance of SearchProductTVC.")
        }
        
        cell.itemVM = viewModel.itemAtIndex(indexPath)
        
        return cell
    }
    
}
