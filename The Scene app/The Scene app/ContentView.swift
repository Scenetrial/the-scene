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

Now that you have the complete ContentView.swift code, would you like me to help you with creating the Theme.swift file next? The Theme file is required for this code to work since it contains all our color definitions and design constants.
