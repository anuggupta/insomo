import SwiftUI

struct SleepRecordView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.1, green: 0.1, blue: 0.2), Color(red: 0.05, green: 0.05, blue: 0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            Text("Sleep Record & Progress")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SleepRecordView_Previews: PreviewProvider {
    static var previews: some View {
        SleepRecordView()
    }
}
