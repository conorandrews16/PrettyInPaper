//
//  CardListener.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 08/03/2021.
//

import Foundation
import Firebase

class CardListener: ObservableObject {
    
    @Published var cards: [Card] = []
    
    init() {
        downloadCards()
    }
    
    func downloadCards() {
        
        FirebaseReference(.ProductList).getDocuments { (snapshot, error) in
        
            guard let snapshot = snapshot else { return }
            
            if !snapshot.isEmpty {
                self.cards = CardListener.cardFromDictionary(snapshot)
            }
        }
    }
    
        static func cardFromDictionary(_ snapshot: QuerySnapshot) -> [Card] {
        
        var allCards: [Card] = []
        
        for snapshot in snapshot.documents {
            
            let cardData = snapshot.data()
            
            allCards.append(Card(id: cardData[kID] as? String ?? UUID().uuidString, name: cardData[kNAME] as? String ?? "unknown", imageName: cardData[kIMAGENAME] as? String ?? "unknown", category: Category(rawValue: cardData[kCATEGORY] as? String ?? "kit") ?? .kit, description: cardData[kDESCRIPTION] as? String ?? "Description is missing", price: cardData[kPRICE] as? Double ?? 0.0))
        }
        return allCards
    }
}
