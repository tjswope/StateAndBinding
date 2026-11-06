//
//  4-ScoreboardView.swift
//  Lesson 4: @Binding lets a child view change a value its parent owns.
//
//  The parent (ScoreboardView) owns the scores with @State. Each team card
//  (TeamScoreView) needs to show its score AND change it.
//

import SwiftUI

struct ScoreboardView: View {
    @State private var homeScore = 0
    @State private var awayScore = 0

    var body: some View {
        VStack(spacing: 24) {
            Text(leader)
                .font(.title2.bold())

            HStack(spacing: 16) {
                // TODO 3: Pass bindings instead of plain values: $homeScore, $awayScore.
                TeamScoreView(team: "Home", color: .blue, score: homeScore)
                TeamScoreView(team: "Away", color: .red, score: awayScore)
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

    /// Who's winning. This updates by itself once the cards can change the scores.
    private var leader: String {
        if homeScore == awayScore { return "Tied" }
        return homeScore > awayScore ? "Home leads" : "Away leads"
    }
}

/// One team's card. It doesn't own the score; the scoreboard does.
struct TeamScoreView: View {
    let team: String
    let color: Color
    // TODO 1: A plain `var` is a copy: this view can't change the parent's score.
    //         Change it to `@Binding var score: Int`.
    //         (Discuss: why not @State? Try it, and watch "Tied" never change.)
    var score: Int

    var body: some View {
        VStack(spacing: 12) {
            Text(team)
                .font(.headline)
            Text("\(score)")
                .font(.system(size: 64, weight: .bold))
            HStack {
                Button("+1") {
                    // TODO 2: Add 1 to score.
                }
                Button("+3") {
                    // TODO 2: Add 3 to score.
                }
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
    ScoreboardView()
}

// TODO 4: Once TeamScoreView uses @Binding, this preview needs a binding.
//         Use .constant(7) to preview a fixed score, or replace the whole
//         preview with this to make the buttons work in the canvas:
//
//         #Preview {
//             @Previewable @State var score = 7
//             TeamScoreView(team: "Home", color: .blue, score: $score)
//         }
#Preview("Team card") {
    TeamScoreView(team: "Home", color: .blue, score: 7)
        .padding()
}
