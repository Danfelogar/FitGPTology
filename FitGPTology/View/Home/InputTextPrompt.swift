//
//  InputTextPrompt.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct InputTextPrompt: View {
    //MARK: - Properties
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) var colorScheme
    @State private var imageShow: UIImage?
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var messageGenerator:String = ""
    //MARK: - Functions
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    //Func
    func addQuestion () {
        var messageForSend: MessageStore? = nil
        //sent and instanse for decode
        if let base64String = imageShow?.toBase64String() {
            messageForSend = MessageStore(id: UUID(), owner: OwnerType.user, image: base64String, content: messageGenerator, timeSend: Date())
        } else {
            messageForSend = MessageStore(id: UUID(), owner: OwnerType.user, image: nil, content: messageGenerator, timeSend: Date())
        }
        
        if let messageToSend = messageForSend {
            context.insert(messageToSend)
        }
        
        messageGenerator = ""
        imageShow = nil
        photoPickerItem = nil
    }
    //MARK: - Body
    var body: some View {
        VStack {
            
            if imageShow != nil {
                ZStack(alignment: .center) {
                    Image(uiImage: imageShow!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 180 )
                    
                }//: ZStrack
                .frame(width: 360, height: 220)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(color: .gray, radius: 2)
                .overlay(
                    Button(action: {
                        // Acción del botón aquí
                        photoPickerItem = nil
                        imageShow = nil
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                        .padding(.top, -105)
                        .padding(.leading, 240)
                )
                .padding(.horizontal)
                .padding(.bottom, -16)
            }
            
            HStack(spacing: 2) {
                TextField("Type the message...", text: $messageGenerator)
                    .frame(height: 35)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                HStack(spacing: 8) {
                    PhotosPicker(selection: $photoPickerItem, matching: .any(of: [.images, .screenshots])) {
                        Image(systemName: "paperclip")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundStyle(Color.blueLightSwiftUI)
                    }
                    
                    HStack {
                        Button {
                            //action
                            if !messageGenerator.isEmpty {
                                addQuestion()
                            }
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 23, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .foregroundStyle(.white)
                        }//:Btn
                    }//: HStack
                    .frame(height: 55)
                    .background(messageGenerator.isEmpty ? Color.gray : Color.blueLightSwiftUI)
                }//: HStack
            }//: HStack
            .onChange(of: photoPickerItem) { _, _ in
                Task {
                    if let photoPickerItem, let data = try? await photoPickerItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            imageShow = image
                        }
                    }
                    photoPickerItem = nil
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .gray, radius: 2)
            .padding(.horizontal)
        }//: VStack
    }
}

struct InputTextPrompt_Previews: PreviewProvider {
    static var previews: some View {
        InputTextPrompt()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
