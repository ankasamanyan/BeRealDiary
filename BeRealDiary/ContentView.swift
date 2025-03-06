import SwiftUI

struct BeRealDiary: View {

    @State private var imageData: Data?
    @State private var showCamera: Bool = false

    var body: some View {
        VStack {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
            }
            ZStack {
                Button("Take a photo") {
                    self.showCamera.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .padding()
        .fullScreenCamera(isPresented: $showCamera, imageData: $imageData)
    }
}

extension View {
    func fullScreenCamera(isPresented: Binding<Bool>, imageData: Binding<Data?>) -> some View {
        self.fullScreenCover(isPresented: isPresented, content: {
            CameraView(imageData: imageData, showCamera: isPresented)
        })
    }
}

#Preview {
    BeRealDiary()
}
