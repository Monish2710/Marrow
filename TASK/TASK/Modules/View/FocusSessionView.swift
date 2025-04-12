//
//  FocusSessionView.swift
//  TASK
//
//  Created by Monish Kumar on 12/04/25.
//

import SwiftUI

struct FocusSessionView: View {
    @EnvironmentObject var sessionManager: FocusSessionManager
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo.opacity(0.3), .blue.opacity(0.3)],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("🔆 Focusing on \(sessionManager.currentMode?.rawValue ?? "")")
                    .font(.title)
                    .padding(.top)

                Text(formatTime(sessionManager.elapsedTime))
                    .font(.system(size: 56, weight: .bold, design: .monospaced))
                    .padding(.bottom)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(sessionManager.badges) { badge in
                            Text(badge.symbol)
                                .font(.largeTitle)
                                .padding(8)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                    }
                }

                Button("⏹ Stop Focusing") {
                    _ = sessionManager.stopSession()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding(.top, 24)

                Spacer()
            }
            .padding()
            .onChange(of: scenePhase, { _, newValue in
                if newValue == .background {
                    sessionManager.persistOngoingSession()
                }
            })
        }
    }

    func formatTime(_ seconds: TimeInterval) -> String {
        let total = Int(seconds)
        if total >= 3600 {
            return String(format: "%02d:%02d:%02d", total / 3600, (total / 60) % 60, total % 60)
        } else {
            return String(format: "%02d:%02d", (total / 60) % 60, total % 60)
        }
    }
}
