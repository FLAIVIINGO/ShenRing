//
//  UniliteralLessonView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 4/15/25.
//

import SwiftUI

struct UniliteralLessonView: View {
    var body: some View {
        lessonCards
    }
    
    var lessonCards: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())]) {
                LessonCardView(
                    title: "Lesson 1",
                    glyphs: ["𓇌", "𓅱", "𓃀", "𓊪", "𓆑"]
                )
                LessonCardView(
                    title: "Lesson 2",
                    glyphs: ["𓅓", "𓈖", "𓂋", "𓉔", "𓋴"]
                )
                LessonCardView(
                    title: "Lesson 3",
                    glyphs: ["𓊃", "𓎡", "𓎼", "𓏏", "𓂧"]
                )
                LessonCardView(
                    title: "Lesson 4",
                    glyphs: ["𓈙", "𓍿", "𓆓", "𓄿", "𓇋"]
                )
                LessonCardView(
                    title: "Lesson 5",
                    glyphs: ["𓂝", "𓎛", "𓐍", "𓄡", "𓏘"]
                )
            }
        }
    }
}

struct LessonCardView: View {
    let title: String
    let glyphs: [String]
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title2.bold())
                HStack {
                    ForEach(glyphs, id: \.self) {glyph in
                        Text(glyph)
                            .font(.custom("Aegyptus", size: 22))
                    }
                }
            }
            .padding()
        }
        .padding(16)
    }
}

#Preview {
    UniliteralLessonView()
}
