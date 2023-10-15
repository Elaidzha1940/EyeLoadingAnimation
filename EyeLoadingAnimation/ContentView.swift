//  /*
//
//  Project: EyeLoadingAnimation
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.10.2023
//
//  */

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    
    var body: some View {
        
        ZStack {
            HStack(spacing: 20) {
                BrowShape()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 160, height: 40)
                
                BrowShape()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 160, height: 40)
            }
            .padding(.bottom, 30)
            
            HStack(spacing: 30) {
                
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 140, height: isAnimating ? 50 : 50)
                    .animation(.easeInOut(duration: 1.2).repeatForever(), value: isAnimating)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                            Circle()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                    )
                
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 140, height: isAnimating ? 5 : 50)
                    .animation(.easeInOut(duration: 1.2).repeatForever(), value: isAnimating)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                            Circle()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                    )
            }
            .onAppear {
                isAnimating = true
            }
            
            NoseShape()
                .fill(Color.white)
                .frame(width: 150, height: 50)
                .offset(y: 40)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

struct BrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY - rect.height * 0.3))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.75, y: rect.minY - rect.height * 0.3))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}

struct NoseShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY + 15), control: CGPoint(x: rect.midX - 15, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.midX + 15, y: rect.midY))
        return path
    }
}
