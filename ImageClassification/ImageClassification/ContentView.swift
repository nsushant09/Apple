import ImageIO
import PhotosUI
import SwiftUI

struct ContentView: View {

    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: CGImage?

    @State private var predictions: [Prediction] = []
    @State private var isClassifying = false
    @State private var errorMessage: String?

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                // MARK: - Image Preview

                if let selectedImage {

                    Image(
                        decorative: selectedImage,
                        scale: 1.0
                    )
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 300,
                        height: 300
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 15
                        )
                    )

                } else {

                    ContentUnavailableView(
                        "No Image Selected",
                        systemImage: "photo",
                        description: Text(
                            "Choose a photo to classify."
                        )
                    )
                    .frame(height: 300)
                }

                // MARK: - Choose Photo

                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images
                ) {
                    Label(
                        "Choose Photo",
                        systemImage: "photo.on.rectangle"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                // MARK: - Classify Button

                Button {
                    classifyImage()
                } label: {

                    if isClassifying {

                        ProgressView()
                            .frame(maxWidth: .infinity)

                    } else {

                        Label(
                            "Classify Image",
                            systemImage: "sparkles"
                        )
                        .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.bordered)
                .disabled(
                    selectedImage == nil || isClassifying
                )

                // MARK: - Predictions

                if !predictions.isEmpty {

                    VStack(
                        alignment: .leading,
                        spacing: 12
                    ) {

                        Text("Predictions")
                            .font(.headline)

                        ForEach(predictions) { prediction in

                            HStack {

                                Text(prediction.label)

                                Spacer()

                                Text(
                                    prediction.confidence,
                                    format: .percent.precision(
                                        .fractionLength(1)
                                    )
                                )
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }

                // MARK: - Error

                if let errorMessage {

                    Text(errorMessage)
                        .foregroundStyle(.red)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("ResNet-50")
            .task(id: selectedItem) {
                await loadImage()
            }
        }
    }

    // MARK: - Load Image

    private func loadImage() async {

        guard let selectedItem else {
            return
        }

        do {

            guard
                let data = try await selectedItem.loadTransferable(
                    type: Data.self
                )
            else {
                return
            }

            guard
                let source = CGImageSourceCreateWithData(
                    data as CFData,
                    nil
                )
            else {
                errorMessage = "Could not read the image."
                return
            }

            guard
                let image = CGImageSourceCreateImageAtIndex(
                    source,
                    0,
                    nil
                )
            else {
                errorMessage = "Could not create the image."
                return
            }

            selectedImage = image
            predictions = []
            errorMessage = nil

        } catch {

            errorMessage = error.localizedDescription
        }
    }

    // MARK: - Classify Image

    private func classifyImage() {

        guard let selectedImage else {
            return
        }

        isClassifying = true
        predictions = []
        errorMessage = nil

        do {

            let classifier = try ImageClassifier()

            classifier.classify(
                image: selectedImage
            ) { result in

                isClassifying = false

                switch result {

                case .success(let results):
                    predictions = results

                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }

        } catch {

            isClassifying = false
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    ContentView()
}
