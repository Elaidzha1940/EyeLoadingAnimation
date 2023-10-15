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
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 30) {
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 140, height: isAnimating ? 0 : 50)
                    .animation(.easeInOut(duration: 1.2).repeatForever(), value: isAnimating)
                    .overlay(
                        Circle()
                            .frame(width: 20, height: 20)
                    )
                
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 140, height: isAnimating ? 0 : 50)
                    .animation(.easeInOut(duration: 1.2).repeatForever(), value: isAnimating)
                    .overlay(
                        Circle()
                            .frame(width: 20, height: 20)
                    )
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    ContentView()
}
