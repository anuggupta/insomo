import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ZStack {
                // Refined Background
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.05, green: 0.05, blue: 0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)


                VStack {
                    // Top Navigation Bar
                    HStack {
                        Button("New Meeting") {}
                            .buttonStyle(TopNavButton())

                        Button("Schedule") {}
                            .buttonStyle(TopNavButton())

                        Button("Join Meeting") {}
                            .buttonStyle(TopNavButton())

                        Spacer()

                        Text("AL")
                            .font(.headline.weight(.bold))
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .background(Color.yellow.opacity(0.8))
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    Spacer(minLength: 30)

                    // 2x2 Grid of Cards
                    LazyVGrid(columns: columns, spacing: 20) {
                        NavigationLink(destination: TrackView()) {
                           CardView(icon: "chart.bar.xaxis", title: "Track Record")
                        }

                        CardView(icon: "clock.arrow.2.circlepath", title: "Routine")
                        CardView(icon: "figure.yoga", title: "YOGA")
                        CardView(icon: "leaf.arrow.triangle.circlepath", title: "Herbs")
                    }
                    .padding(.horizontal)

                    Spacer()

                    // Bottom Navigation Bar
                    HStack {
                        Spacer()
                        BottomNavItem(icon: "house.fill")
                        Spacer()
                        BottomNavItem(icon: "music.note")
                        Spacer()
                        VStack {
                             Image(systemName: "brain.head.profile")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                             Text("Inso Ai")
                                .foregroundColor(.white)
                                .font(.caption2)
                        }
                        .padding(.bottom, 10) // Elevate the center button slightly
                        Spacer()
                        BottomNavItem(icon: "doc.text")
                        Spacer()
                        BottomNavItem(icon: "gearshape.fill")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(25)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Custom button style for top navigation
struct TopNavButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.1))
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

// Reusable view for bottom navigation items
struct BottomNavItem: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 26))
            .foregroundColor(.white.opacity(0.8))
    }
}


struct CardView: View {
    let icon: String
    let title: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 44, weight: .light))
                .foregroundColor(.white)
            Text(title)
                .foregroundColor(.white)
                .padding(.top, 8)
                .font(.headline)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 150)
        .background(Color.white.opacity(0.1))
        .cornerRadius(20)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
