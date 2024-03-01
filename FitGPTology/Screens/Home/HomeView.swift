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
    
    //Body
    var body: some View {
        GeometryReader { geometry in
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
                Spacer() // Añade un Spacer aquí para forzar el VStack a ocupar todo el espacio vertical
                //Text Input Area
                InputTextPrompt()
            }//: VStack
        }//: Geometry
    }
}


#Preview { HomeView().modelContainer(for: [MessageStore.self], inMemory: true) }
