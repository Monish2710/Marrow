//
//  HomeView.swift
//  TASK
//
//  Created by Monish Kumar on 12/04/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var sessionManager = FocusSessionManager()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue.opacity(0.3), .purple.opacity(0.4)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    Text("🎯 Choose Focus Mode")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    ForEach(FocusMode.allCases) { mode in
                        Button {
                            sessionManager.startSession(mode: mode)
                        } label: {
                            HStack {
                                Image(systemName: icon(for: mode))
                                Text(mode.rawValue)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .shadow(radius: 4)
                        .padding(.horizontal)
                    }

                    Spacer()

                    NavigationLink("👤 Profile", destination: ProfileView())
                        .padding(.top, 20)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .onAppear {
                    sessionManager.resumeSessionIfNeeded()
                }
            }
            .navigationDestination(isPresented: $sessionManager.isFocusing) {
                FocusSessionView()
                    .environmentObject(sessionManager)
            }
        }
    }

    func icon(for mode: FocusMode) -> String {
        switch mode {
        case .work: return "briefcase.fill"
        case .play: return "gamecontroller.fill"
        case .rest: return "cup.and.saucer.fill"
        case .sleep: return "bed.double.fill"
        }
    }
}
