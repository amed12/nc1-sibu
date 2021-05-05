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
    var salary = 6500000.0
    var model = RecommendationModel()
    
    @IBOutlet weak var lblSalary: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView()  {
        isRecommendationEmpty = salary > 0.0 ? false : true
        if isRecommendationEmpty {
            loadEmptyState()
        }else{
            loadRecomState()
            lblSalary.text = "Rp. \(salary)0"
        }
        homeTableView.reloadData()
    }
    
    func loadEmptyState()  {
        homeTableView.register(UINib(nibName: "EmptyStateViewCell", bundle: nil), forCellReuseIdentifier: "emptyHomeCell")
    }
    
    func loadRecomState()  {
        homeTableView.register(UINib(nibName: "RecommendedAllocationViewCell", bundle: nil), forCellReuseIdentifier: "recommendationHomeCell")
    }

}

extension HomeController :UITableViewDelegate,UITableViewDataSource,EmptyStateViewCellDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isRecommendationEmpty ? 1 : model.recommendationBudget.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isRecommendationEmpty {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "emptyHomeCell", for: indexPath) as? EmptyStateViewCell
            cell?.delegateButton = self
            cell?.selectionStyle = .none
            return cell!
        }else{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "recommendationHomeCell", for: indexPath) as? RecommendedAllocationViewCell
            let recommendation = model.getRecommendationBudget(budgetPriority: indexPath.row)
            let nominal = model.calculateNominal(budgetPriority: indexPath.row, salary: salary)
            cell?.title.text = recommendation.title
            cell?.subtitle.text = recommendation.subtitle
            cell?.icon.image = UIImage(named: recommendation.image)
            cell?.nominal.text = "\(nominal)"
            cell?.selectionStyle = .none
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isRecommendationEmpty ? 350 : 65
    }
    
    func didClickButtonAddSalary() {
        self.performSegue(withIdentifier: "toAddSalary", sender: nil)
    }
    
}
