//
//  QuestionFeedbackView.swift
//  ShenRing
//
//  Created by Andrew Babilonia on 3/22/25.
//

import SwiftUI

struct QuestionFeedbackView: View {
    var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Button(action: {}, label: {
                Text("Continue")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black.opacity(0.7))
                    .cornerRadius(12)
            })
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.37)
        .background(RoundedRectangle(cornerRadius: 12).fill(.green))
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}
