import SwiftUI

struct TrackView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.05, green: 0.05, blue: 0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 20) {
                // Custom Navigation
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2.weight(.bold))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()

                Text("Track")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .padding(.horizontal)

                // Feature Links
                VStack(spacing: 15) {
                    NavigationLink(destination: SleepRecordView()) {
                        TrackOptionRow(title: "Sleep Record & Progress", icon: "bed.double.fill")
                    }

                    NavigationLink(destination: InsomniaCheckView()) {
                        TrackOptionRow(title: "Insomnia Check & Recovery Guide", icon: "magnifyingglass")
                    }

                    NavigationLink(destination: ScreenTimingView()) {
                        TrackOptionRow(title: "Screen Timing Sync", icon: "iphone.radiowaves.left.and.right")
                    }
                }
                .padding()

                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

// Reusable view for the track option rows
struct TrackOptionRow: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 40)

            Text(title)
                .foregroundColor(.white)
                .font(.headline)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.5))
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView()
    }
}
