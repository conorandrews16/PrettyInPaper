//
//  OrderBasket.swift
//  Pods
//
//  Created by Conor Andrews on 15/03/2021.
//

import Foundation
import Firebase

class OrderBasket: Identifiable {
    var id: String!
    var ownerId: String!
    var items: [Card] = []
    
    var total: Double {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0.0
        }
    }
    
    func add(_ item: Card) {
        items.append(item)
    }
    
    func remove(_ item: Card) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func emptyBasket() {
        self.items = []
        saveBasketToFirestore()
    }
    
    func saveBasketToFirestore() {
        FirebaseReference(.Basket).document(self.id).setData(basketDictionaryFrom(self))
    }
}

func basketDictionaryFrom(_ basket: OrderBasket) -> [String : any] {
    var allCardIds: [String] = []
    for card in basket.items {
        allCardIds.append(card.id)
    }
    
    return NSDictionary(objects: [ basket.id,
                                   basket.ownerId,
                                   allCardIds
                                 ],
        forKeys: [ kID as NSCopying,
                   KOWNERID as NSCopying,
                   kDRINKIDS as NSCopying
    ]) as! [String : any]
}
