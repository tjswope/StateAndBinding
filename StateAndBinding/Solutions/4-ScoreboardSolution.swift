//
//  4-ScoreboardSolution.swift
//  Lesson 4, finished.
//

import SwiftUI

struct ScoreboardSolution: View {
    @State private var homeScore = 0
    @State private var awayScore = 0

    var body: some View {
        VStack(spacing: 24) {
            Text(leader)
                .font(.title2.bold())

            HStack(spacing: 16) {
                TeamScoreSolutionView(team: "Home", color: .blue, score: $homeScore)
                TeamScoreSolutionView(team: "Away", color: .red, score: $awayScore)
            }

            Button("New Game") {
                homeScore = 0
                awayScore = 0
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("Scoreboard")
    }

    private var leader: String {
        if homeScore == awayScore { return "Tied" }
        return homeScore > awayScore ? "Home leads" : "Away leads"
    }
}

struct TeamScoreSolutionView: View {
    let team: String
    let color: Color
    @Binding var score: Int

    var body: some View {
        VStack(spacing: 12) {
            Text(team)
                .font(.headline)
            Text("\(score)")
                .font(.system(size: 64, weight: .bold))
            HStack {
                Button("+1") { score += 1 }
                Button("+3") { score += 3 }
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.15), in: .rect(cornerRadius: 16))
        .tint(color)
    }
}

#Preview {
    ScoreboardSolution()
}

#Preview("Team card") {
    @Previewable @State var score = 7
    TeamScoreSolutionView(team: "Home", color: .blue, score: $score)
        .padding()
}
