//
//  InfoVC.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez Montero on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Info"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapEmail(_ sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:info@liguillasdepadel.es")!)
    }
    
    @IBAction func tapWhastApp(_ sender: Any) {
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=34644228705")
        if UIApplication.shared.canOpenURL(whatsappURL!) {
            UIApplication.shared.open(whatsappURL!)
        }
    }

}
