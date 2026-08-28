//
// Components.swift
// Reusable SwiftUI components for the prototype
//

import SwiftUI

struct Card<Content: View>: View {
    let content: Content
    var body: some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 6, x: 0, y: 4)
    }
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title).font(.headline)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct LuminaryPanelView: View {
    var suggestions: [LuminarySuggestion]
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Image(systemName: "lightbulb.fill").foregroundStyle(.yellow); Text("Luminary").font(.headline); Spacer() }
            ForEach(suggestions) { s in
                Text("• \(s.message)")
                    .font(.subheadline)
                    .padding(.vertical, 2)
            }
        }
        .padding()
        .background(Color(.systemBackground).opacity(0.6))
        .cornerRadius(12)
    }
}

struct TimelineView: View {
    let stages: [String]
    let currentStage: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Array(stages.enumerated()), id: \.(offset)) { index, stage in
                    VStack {
                        ZStack {
                            Circle()
                                .fill(index+1 == currentStage ? Color.accentColor : Color.gray.opacity(0.3))
                                .frame(width: 44, height: 44)
                            Text("\(index+1)").foregroundColor(.white)
                        }
                        Text(stage).font(.caption).frame(width: 120)
                    }
                }
            }
            .padding()
        }
    }
}
