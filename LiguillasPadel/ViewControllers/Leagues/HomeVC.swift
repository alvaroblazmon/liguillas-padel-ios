//
//  HomeVC.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez Montero on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Liguillas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        prepareTableView()
        viewModel.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareTableView() {
        let nib = UINib(nibName: LeagueTVC.XibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LeagueTVC.ReuseIdentifier)
        tableView.tableFooterView = UIView()
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeagueTVC.ReuseIdentifier, for: indexPath) as? LeagueTVC  else {
            fatalError("The dequeued cell is not an instance of SearchProductTVC.")
        }
        
        cell.itemVM = viewModel.itemAtIndex(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(index: indexPath.row)
    }
    
}

extension HomeVC: ViewModelDelegate {
    func render(state: ProcessViewState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            activityIndicator.stopAnimating()
            tableView.reloadData()
        case .error:
            activityIndicator.stopAnimating()
        }
    }
    
}
