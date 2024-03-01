//
//  MessageModel.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import Foundation
import SwiftData

@Model
final class MessageStore: Identifiable, Equatable, Hashable {
    var id: UUID
    var owner: OwnerType
    var image: String?
    var content: String
    var timeSend: Date
    
    init(id: UUID, owner: OwnerType, image:String?, content: String, timeSend: Date) {
        self.id = id
        self.owner = owner
        self.image = image
        self.content = content
        self.timeSend = timeSend
    }
}
