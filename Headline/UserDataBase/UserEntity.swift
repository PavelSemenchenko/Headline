//
//  UserEntity.swift
//  Headline
//
//  Created by Pavel Semenchenko on 05.12.2023.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserEntity: Codable, Hashable ,Identifiable {
    @DocumentID var id: String?
    var name: String
    var nickName: String
    //fileprivate(set) var image: String = ""
}
