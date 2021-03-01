//
//  FirebaseReference.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 01/03/2021.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case ProductList
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    Firestore.firestore().collection(collectionReference.rawValue)
}
