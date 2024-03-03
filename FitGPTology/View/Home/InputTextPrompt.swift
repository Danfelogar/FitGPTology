//
//  InputTextPrompt.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI
import PhotosUI
import SwiftData
import OpenAI

struct InputTextPrompt: View {
    //MARK: - Properties
    @Query(sort: \MessageStore.timeSend) private var messages: [MessageStore]
    
    @Environment(\.modelContext) private var context
    
    @FocusState private var focusedField: Field?
    
    @StateObject var viewModel = InputTextController()
    //listening all changes this variable
    @Binding  var isKeyboardOpen: Bool
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            if viewModel.imageShow != nil {
                ZStack(alignment: .center) {
                    Image(uiImage: viewModel.imageShow!)
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
                        viewModel.photoPickerItem = nil
                        viewModel.imageShow = nil
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
                TextField("Type the message...", text: $viewModel.messageGenerator, axis: .vertical)
                    .frame(minHeight: 35)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                    .focused($focusedField, equals: .messageGenerator)
                    .onChange(of: focusedField) {
                        if focusedField == .messageGenerator {
                            isKeyboardOpen = true
                        }
                        print("InputTextPrompt isKeyboardOpen \(isKeyboardOpen)")
                    }
                
                HStack(spacing: 8) {
                    PhotosPicker(selection: $viewModel.photoPickerItem, matching: .any(of: [.images, .screenshots])) {
                        Image(systemName: "paperclip")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundStyle(Color.blueLightSwiftUI)
                    }
                    
                    HStack {
                        Button {
                            //action
                            Task.init {
                                do {
                                    isKeyboardOpen = false
                                    focusedField = nil
                                    let msmShowUser = try await viewModel.addQuestion()
                                    context.insert(msmShowUser!)
                                    
                                    let msmResponseBot = try await viewModel.getBotResponse(messages)
                                    context.insert(msmResponseBot!)
                                    
                                } catch {
                                    // Handle the error here.
                                    viewModel.handleError(error)
                                }
                            }
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 23, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .foregroundStyle(.white)
                        }//:Btn
                        .disabled(viewModel.isLoading || viewModel.messageGenerator.isEmpty)
                    }//: HStack
                    .frame(height: 55)
                    .background(viewModel.messageGenerator.isEmpty || viewModel.isLoading ? Color.gray : Color.blueLightSwiftUI)
                }//: HStack
            }//: HStack
            //            .onTapGesture {
            //                // Aquí intentamos cerrar el teclado
            //                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            //            }
            .onChange(of: viewModel.photoPickerItem) { _, _ in
                Task {
                    await viewModel.loadImageFromPickerItem()
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: .gray, radius: 2)
            .padding(.horizontal)
        }//: VStack
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissBtn)
        }
    }
}

struct InputTextPrompt_Previews: PreviewProvider {
    static var previews: some View {
        InputTextPrompt(isKeyboardOpen: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
