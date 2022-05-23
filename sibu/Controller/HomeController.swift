//
//  ViewController.swift
//  sibu
//
//  Created by Achmad Fathullah on 04/05/21.
//

import UIKit

class HomeController: UIViewController {
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var btnReset: DefaultButton!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    var isRecommendationEmpty = true
    var salary = 0.0
    var model = RecommendationModel()
    
    @IBOutlet weak var lblSalary: UILabel!
    
    //to make table view height size fit with content
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        let additionalHeight = isRecommendationEmpty ? 350.0 : 90.0
        self.tableHeight?.constant = self.homeTableView.contentSize.height + CGFloat(additionalHeight)
    }
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
            lblSalary.text = doubleToRupiah(salary)
        }
        homeTableView.reloadData()
    }
    
    func loadEmptyState()  {
        homeTableView.register(UINib(nibName: "EmptyStateViewCell", bundle: nil), forCellReuseIdentifier: "emptyHomeCell")
    }
    
    func loadRecomState()  {
        homeTableView.register(UINib(nibName: "RecommendedAllocationViewCell", bundle: nil), forCellReuseIdentifier: "recommendationHomeCell")
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        if let sourceViewController = seg.source as? AddSalaryController {
            salary = sourceViewController.dataPassed
            setupView()
        }
    }
    @IBAction func onClickReset(_ sender: Any) {
        salary = 0
        lblSalary.text = "Not Set"
        setupView()
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
            btnReset.isHidden = true
            return cell!
        }else{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "recommendationHomeCell", for: indexPath) as? RecommendedAllocationViewCell
            let recommendation = model.getRecommendationBudget(budgetPriority: indexPath.row)
            let nominal = model.calculateNominal(budgetPriority: indexPath.row, salary: salary)
            cell?.title.text = recommendation.title
            cell?.subtitle.text = recommendation.subtitle
            cell?.icon.image = UIImage(named: recommendation.image)
            cell?.nominal.text = doubleToRupiah(nominal)
            cell?.selectionStyle = .none
            btnReset.isHidden = false
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isRecommendationEmpty {
            let description = model.getRecommendationBudget(budgetPriority: indexPath.row).description
            let title = model.getRecommendationBudget(budgetPriority: indexPath.row).title
            showAlert(title: title, subtitle: description)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return isRecommendationEmpty ? 350 : 65
    }
    
    
    func didClickButtonAddSalary() {
        self.performSegue(withIdentifier: "toAddSalary", sender: self)
    }
    
    func showAlert(title:String, subtitle:String) {
        let alertController = UIAlertController(title: title, message:
                subtitle, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

            self.present(alertController, animated: true, completion: nil)
    }
    
}
