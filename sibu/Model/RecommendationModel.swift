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
        Recommendation(title: "Kindness", subtitle: "10% of salary", image: "love", nominal: 0.1, description: "Regardless of your income, big or small, always try to do good. The definition of doing good is very broad, not only limited to giving donations at places of worship, but also other things such as being devoted to parents and giving assistance wisely to others in need."),
        Recommendation(title: "Future", subtitle: "20% of salary", image: "future", nominal: 0.2 , description: "In the financial context, preparation for the future includes things such as Emergency Funds, Life and Health Insurance, Children's Education Funds, Pension Funds, Funds for DP Houses (for those who do not yet have them), Developing Wealth and funds for various other financial purposes."),
        Recommendation(title: "Installment", subtitle: "30% of salary", image: "percent", nominal: 0.3,description: "Having debt and installments in the context of financial planning is still good as long as it is used to buy a house, vehicle, or equipment for productive needs. Homes with rental status can also be included in this allocation."),
        Recommendation(title: "Needs", subtitle: "40% of salary", image: "money", nominal: 0.4,description: "This percentage is ideally used to meet the necessities of life including food costs, transportation, utility bills, telephone credit, television subscriptions, sports membership, hobbies, clothing, recreation and so on.")
    ]
    
    func getRecommendationBudget(budgetPriority :Int) -> Recommendation {
        return recommendationBudget[budgetPriority]
    }
    
    func calculateNominal(budgetPriority:Int,salary:Double) -> Double {
        return recommendationBudget[budgetPriority].nominal * salary
    }
}
