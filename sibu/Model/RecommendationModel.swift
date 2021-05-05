//
//  RecommendationModel.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//  

import Foundation

class RecommendationModel {
    var salary = 0.0
    
    let recommendationBudget = [
        Recommendation(title: "Kindness", subtitle: "10% of your salary", image: "love", nominal: 0.1),
        Recommendation(title: "Future", subtitle: "20% of your salary", image: "future", nominal: 0.2),
        Recommendation(title: "Installment", subtitle: "30% of your salary", image: "percent", nominal: 0.3),
        Recommendation(title: "Needs", subtitle: "40% of your salary", image: "money", nominal: 0.4)
    ]
    
    func getRecommendationBudget(budgetPriority :Int) -> Recommendation {
        return recommendationBudget[budgetPriority]
    }
    
    func calculateNominal(budgetPriority:Int,salary:Double) -> Double {
        return recommendationBudget[budgetPriority].nominal * salary
    }
}
