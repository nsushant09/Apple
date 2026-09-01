//
//  ImageClassifier.swift
//  ImageClassification
//
//  Created by SushantNeupane on 9/1/26.
//

import Foundation
import SwiftUI
import CoreGraphics
import Vision
import CoreML

struct Prediction: Identifiable{
    let id = UUID()
    let label: String
    let confidence: Float
}

enum ClassifierError: LocalizedError{
    case noResults
    var errorDescription: String?{
        switch self{
        case .noResults: return "The model returned no classification results"
        }
    }
}
final class ImageClassifier{
    private let visionModel: VNCoreMLModel
    
    init()throws{
        let config = MLModelConfiguration()
        let model = try Resnet50FP16(configuration: config).model
        self.visionModel = try VNCoreMLModel(for:model)
    }
    
    func classify(
        image: CGImage,
        completion: @escaping (Result<[Prediction], Error>) -> Void
    ){
        let request = VNCoreMLRequest(model: visionModel){ request, error in
            if let error { DispatchQueue.main.async {
                completion(.failure(error))
            }
                return
            }
            
            guard let observations = request.results as? [VNClassificationObservation] else {
                DispatchQueue.main.async{
                    completion(.failure(ClassifierError.noResults))
                }
                return
            }
            
            let predictions = observations
                .prefix(5)
                .map{
                    observation in Prediction(label: observation.identifier, confidence: observation.confidence)
                }
            
            DispatchQueue.main.async{
                completion(.success(Array(predictions)))
            }
        }
        
        request.imageCropAndScaleOption = .centerCrop
        
        let handler = VNImageRequestHandler(cgImage: image, options: [:])
        
        DispatchQueue.global(qos: .userInitiated).async{
            do{
                try handler.perform([request])
            }catch{
                DispatchQueue.main.async{
                    completion(.failure(error))
                }
            }
        }
        
        
    }
}
