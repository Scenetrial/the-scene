import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            VenuesView()
                .tabItem {
                    Image(systemName: "building.2.fill")
                    Text("Venues")
                }
                .tag(1)
            
            EventsView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(Theme.cream)
        .preferredColorScheme(.dark)
    }
}

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

struct VenueCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("The Loft")
                    .font(.headline)
                    .foregroundColor(Theme.cream)
                Spacer()
                Text("70%")
                    .font(.subheadline)
                    .foregroundColor(Theme.lightGold)
            }
            
            Text("Rooftop lounge with cityscape views")
                .font(.subheadline)
                .foregroundColor(Theme.cream.opacity(0.8))
            
            HStack {
                Label("10 min", systemImage: "clock")
                Spacer()
                Label("Live", systemImage: "dot.radiowaves.up")
            }
            .font(.caption)
            .foregroundColor(Theme.cream.opacity(0.6))
        }
        .padding()
        .frame(width: 280)
        .background(
            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                .fill(Theme.brownLight.opacity(0.3))
        )
    }
}

struct EventCard: View {
    var body: some View {
        HStack(spacing: Theme.standardPadding) {
            VStack(spacing: 4) {
                Text("15")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.cream)
                Text("MAR")
                    .font(.caption)
                    .foregroundColor(Theme.cream.opacity(0.8))
            }
            .frame(width: 60)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: Theme.cornerRadius)
                    .fill(Theme.brownLight.opacity(0.3))
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Jazz Night")
                    .font(.headline)
                    .foregroundColor(Theme.cream)
                Text("@ The Loft")
                    .font(.subheadline)
                    .foregroundColor(Theme.cream.opacity(0.8))
                Text("8:00 PM - Late")
                    .font(.caption)
                    .foregroundColor(Theme.cream.opacity(0.6))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Theme.cream.opacity(0.6))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Theme.cornerRadius)
                .fill(Theme.brownLight.opacity(0.3))
        )
    }
}

// Placeholder Views
struct VenuesView: View {
    var body: some View {
        Text("Venues View")
    }
}

struct EventsView: View {
    var body: some View {
        Text("Events View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

#Preview {
    ContentView()
} 