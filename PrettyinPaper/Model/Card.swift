//
//  Card.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 01/03/2021.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case kit
    case pattern
    case paper
}

struct Card: Identifiable, Hashable {
    var id: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double
}

func cardDictionaryFrom(card: Card) -> [String : Any] {
    return NSDictionary(objects: [
        card.id,
        card.name,
        card.imageName,
        card.category.rawValue,
        card.description,
        card.price
    ],
    forKeys: [
        kID as NSCopying,
        kNAME as NSCopying,
        kIMAGENAME as NSCopying,
        kCATEGORY as NSCopying,
        kDESCRIPTION as NSCopying,
        kPRICE as NSCopying
    ]) as! [String : Any]
}

func createMenu() {
    for card in cardData {
        FirebaseReference(.ProductList).addDocument(data: cardDictionaryFrom(card: card))
    }
}

let cardData = [
    // Kit
    Card(id: UUID().uuidString, name: "Test Kit", imageName: "espresso", category: Category.kit, description: "Test kit description", price: 2.99),
    Card(id: UUID().uuidString, name: "Test Kit", imageName: "espresso", category: Category.kit, description: "Test kit description", price: 2.99),
    
    // Pattern
    Card(id: UUID().uuidString, name: "Test Pattern", imageName: "espresso", category: Category.pattern, description: "Test pattern description", price: 2.99),
    Card(id: UUID().uuidString, name: "Test Pattern", imageName: "espresso", category: Category.pattern, description: "Test pattern description", price: 2.99),
    
    // Paper
    Card(id: UUID().uuidString, name: "Test Paper", imageName: "espresso", category: Category.paper, description: "Test paper description", price: 2.99),
    Card(id: UUID().uuidString, name: "Test Paper", imageName: "espresso", category: Category.paper, description: "Test paper description", price: 2.99),
]
