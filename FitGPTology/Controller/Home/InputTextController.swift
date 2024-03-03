//
//  InputTextController.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 2/03/24.
//

import SwiftUI
import PhotosUI
import SwiftData
import OpenAI

final class InputTextController: ObservableObject {
    
    @Published var imageShow: UIImage? = nil
    @Published var photoPickerItem: PhotosPickerItem? = nil
    @Published var messageGenerator:String = ""
    
    @Published var alertItem: AlertItem? = nil
    @Published var isLoading: Bool = false
    
    //MARK: - Function
    func loadImageFromPickerItem() async {
        if let photoPickerItem = photoPickerItem, let data = try? await photoPickerItem.loadTransferable(type: Data.self) {
            
            DispatchQueue.main.async {
                self.imageShow = UIImage(data: data)
            }
        }
        DispatchQueue.main.async {
            self.photoPickerItem = nil
        }
    }
    
    func addQuestion () async throws -> MessageStore? {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        var messageForSend: MessageStore? = nil
        //sent and instanse for decode
        if let base64String = imageShow?.toBase64String() {
            messageForSend = MessageStore(id: UUID(), owner: OwnerType.user, image: base64String, content: messageGenerator, timeSend: Date())
        } else {
            messageForSend = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: messageGenerator, timeSend: Date())
        }
        
        guard let messageToSend = messageForSend else {
            throw APIError.unableToComplete
        }
        
        return messageToSend
    }
    
    func getBotResponse(_ msmArrContenxt: [MessageStore]) async throws -> MessageStore? {
        guard !messageGenerator.isEmpty else {
            throw APIError.invalidData
        }
        
        var messageForReply: MessageStore?
        
        if imageShow == nil && messageGenerator.hasPrefix(keyQueryImg) {
            let queryGenerateImg = ImagesQuery(prompt: messageGenerator.deletingPrefix(keyQueryImg), n: numberImgGenerated, size: sizeImg)
            let result = try await openAI.images(query: queryGenerateImg)
            
            if let url = result.data.first?.url {
                messageForReply = MessageStore(id: UUID(), owner: OwnerType.bot, image: url, content: genericResponse, timeSend: Date())
            }
        } else if imageShow == nil {
            let queryChat = ChatQuery(model: .gpt3_5Turbo, messages: msmArrContenxt.map({Chat(role: .user, content: $0.content)}))
            let result = try await openAI.chats(query: queryChat)
            let resultMSM = result.choices.first!.message.content
            
            if let content = resultMSM {
                messageForReply = MessageStore(id: UUID(), owner: OwnerType.bot, image: nil, content: content, timeSend: Date())
            }
        }
        
        if messageForReply == nil {
            throw APIError.unableToComplete
        }
        
        DispatchQueue.main.async {
            self.messageGenerator = ""
            self.imageShow = nil
            self.photoPickerItem = nil
            self.isLoading = false
        }
        
        return messageForReply
    }
    
    func handleError(_ error: Error) {
        print("Error getting anything response: \(error)")
        
        if let apError = error as? APIError {
            switch apError {
            case .invalidURL:
                DispatchQueue.main.async { [self] in
                    alertItem = AlertContext.invalidURL
                }
            case .invalidResponse:
                DispatchQueue.main.async { [self] in
                    alertItem = AlertContext.invalidResponse
                }
            case .invalidData:
                DispatchQueue.main.async { [self] in
                    alertItem = AlertContext.invalidData
                }
            case .unableToComplete:
                DispatchQueue.main.async { [self] in
                    alertItem = AlertContext.unableToComplete
                }
            }
        } else {
            DispatchQueue.main.async {
                self.alertItem = AlertContext.invalidResponse
            }
        }
    }
    
}
