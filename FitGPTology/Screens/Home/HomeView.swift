//
//  HomeView.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    //Properties
    @Environment(\.modelContext) private var context
    @Query(sort: \MessageStore.timeSend) private var messages: [MessageStore]
    // Make sure to define isKeyboardOpen as @State
    @State private var isKeyboardOpen: Bool = false
    
    //Body
    var body: some View {
        GeometryReader { geometry in

            VStack {
                ZStack{
                    VStack {
                        //Header
                        HeaderChat()
                            .background(Color.blueDarkSwiftUI)
                        //Field of MSM or EmptyState
                        if messages.isEmpty {
                            EmptyState()
                        } else {
                            ScrollViewReader { scrollView in
                                ScrollView(showsIndicators: false) {
                                    VStack(spacing: 8) {
                                        ForEach(Array(messages.enumerated()), id: \.element) { idx, message in
                                            if message.owner == OwnerType.bot {
                                                CellTextBot(contentMSM: message)
                                                //.listRowInsets(EdgeInsets(top:  0, leading:  12, bottom:  -10, trailing:  8))
                                                    .listRowSeparator(.hidden)
                                                    .id(idx)
                                            } else {
                                                CellTextUser(contentMSM: message)
                                                    .listRowSeparator(.hidden)
                                                    .id(idx)
                                            }
                                        }//: Loop
                                        .onChange(of: messages) {
                                            scrollView.scrollTo(messages.count - 1, anchor: .bottom)
                                        }
                                        .onAppear {
                                            scrollView.scrollTo(messages.count - 1, anchor: .bottom)
                                        }
                                    }//: Scroll
                                }//: VStack
                            }//: ScrollViewReader
                            
                        }

                    }//: VStack
                    
                    //press to exit the keyboard
                    if isKeyboardOpen == true {
                        Color.clear
                            .edgesIgnoringSafeArea(.all)
                            .frame(maxHeight: geometry.size.height - 70)
                            .onTapGesture {
                                isKeyboardOpen = false
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                print("home isKeyboardOpen \(isKeyboardOpen)")
                            }
                    }
                }//: ZStack
                
                //Text Input Area
                InputTextPrompt(isKeyboardOpen: $isKeyboardOpen)
            }//: VStack

        }//: Geometry
    }
}


#Preview { HomeView().modelContainer(for: [MessageStore.self], inMemory: true) }
