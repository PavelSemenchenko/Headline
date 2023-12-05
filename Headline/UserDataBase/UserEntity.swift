//
//  UserEntity.swift
//  Headline
//
//  Created by Pavel Semenchenko on 05.12.2023.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct UserEntity: Codable, Hashable ,Identifiable {
    @DocumentID var id: String?
    let name: String
    //let lastName: String
}
