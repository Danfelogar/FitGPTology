//
//  Mock+Ext.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import Foundation

let sampleMessageStoreUser: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: "Hellow, How easy going?", timeSend: Date())
let sampleMessageStoreBot: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "I'm good, thanks. How about you?", timeSend: Date())
let sampleMessageStoreUser1: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: "I'm doing well, thanks. I've been working on a new project.", timeSend: Date())
let sampleMessageStoreBot1: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "That sounds interesting. What kind of project?", timeSend: Date())
let sampleMessageStoreUser2: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: " It's a web development project. I'm learning new technologies and frameworks.", timeSend: Date())
let sampleMessageStoreBot2: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "Cool! I've been meaning to learn more about web development. Do you need any help with it?", timeSend: Date())
let sampleMessageStoreUser3: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: "Well, I could use some advice on certain aspects. Maybe we could study together sometime?", timeSend: Date())
let sampleMessageStoreBot3: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "Sure, I'd love to. When would be a good time for you?", timeSend: Date())
let sampleMessageStoreUser4: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: "How about this weekend? I'm free on Saturday.", timeSend: Date())
let sampleMessageStoreBot4: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "Perfect. We can meet at the library.", timeSend: Date())
let sampleMessageStoreUser5: MessageStore = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: "Great! I'll get in touch with the details.", timeSend: Date())
let sampleMessageStoreBot5: MessageStore = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: "Sounds good. See you then.", timeSend: Date())

var sampleMessageStores: [MessageStore] = [
    sampleMessageStoreUser,
    sampleMessageStoreBot,
    sampleMessageStoreUser1,
    sampleMessageStoreBot1,
    sampleMessageStoreUser2,
    sampleMessageStoreBot2,
    sampleMessageStoreUser3,
    sampleMessageStoreBot3,
    sampleMessageStoreUser4,
    sampleMessageStoreBot4,
    sampleMessageStoreUser5,
    sampleMessageStoreBot5,
]
