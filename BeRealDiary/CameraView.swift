
import SwiftUI

struct CameraView: View {
    @Binding var imageData: Data?
    @Binding var showCamera: Bool

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                // the main screen
                cameraPreview
                HStack {
                    //the future gallery icon
                    Image(systemName: "square.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 32))
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                        .padding(.trailing)
                    // the Camera button
                    ZStack {
                        Circle()
                            .frame(width: 90, height: 90)
                            .foregroundColor(.indigo)
                            .padding()
                        Button(action: {showCamera.toggle()}) {
                            Image(systemName: "camera.fill")
                                .font(.system(size: 32))

                        }
                        .foregroundColor(.white)
                    }
                    .ignoresSafeArea(edges: .all)
                    .padding(.trailing, 30)
                }
                .padding(.trailing, 20)
            }
        }
    }

    private var cameraPreview: some View {
        Color.indigo
    }
}

#Preview {
    CameraView(imageData: .constant(nil), showCamera: .constant(true))
}
