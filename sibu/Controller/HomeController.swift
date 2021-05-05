//
//  ViewController.swift
//  sibu
//
//  Created by Achmad Fathullah on 04/05/21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var isRecommendationEmpty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView()  {
        homeTableView.register(UINib(nibName: "EmptyStateViewCell", bundle: nil), forCellReuseIdentifier: "emptyHomeCell")
    }

}

extension HomeController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "emptyHomeCell", for: indexPath) as? EmptyStateViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    
}
