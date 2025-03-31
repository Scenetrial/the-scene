import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: Theme.largePadding) {
                    // Hero Section
                    VStack(alignment: .leading, spacing: Theme.standardPadding) {
                        Text("Discover Your Scene")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Theme.cream)
                        
                        Text("Real-time insights into the best venues and events in your city. Know before you go.")
                            .font(.body)
                            .foregroundColor(Theme.cream.opacity(0.8))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: Theme.cornerRadius)
                            .fill(Theme.backgroundGradient)
                    )
                    
                    // Live Venues Section
                    VStack(alignment: .leading, spacing: Theme.standardPadding) {
                        Text("Live Now")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Theme.cream)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: Theme.standardPadding) {
                                ForEach(0..<3) { _ in
                                    VenueCard()
                                }
                            }
                        }
                    }
                    
                    // Upcoming Events
                    VStack(alignment: .leading, spacing: Theme.standardPadding) {
                        Text("Upcoming Events")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Theme.cream)
                        
                        VStack(spacing: Theme.standardPadding) {
                            ForEach(0..<3) { _ in
                                EventCard()
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Theme.brownInk.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("app-icon")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(Theme.cream)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
//  Untitled.swift
//  The Scene app
//
//  Created by Daniel Banna on 2025-03-30.
//

