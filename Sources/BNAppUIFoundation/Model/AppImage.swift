//
//  Image.swift
//  AppUI
//
//  Created by Botirjon Nasridinov on 25/02/22.
//

import UIKit
import Kingfisher

public enum AppImage {
    case raw(_ image: UIImage?)
    case asset(_ name: String, bundle: Bundle? = nil)
    case network(_ url: URL, placeholder: UIImage? = nil)
    
    public func getImage(completion: @escaping (UIImage?) -> Void) {
        switch self {
        case .raw(let img):
            completion(img)
        case .asset(let name, let bundle):
            let img = UIImage.init(named: name, in: bundle, compatibleWith: nil)
            completion(img)
            
            
        case .network(let url, _):
            KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil, downloadTaskUpdated: nil) { result in
                switch result {
                case .success(let imgResult):
                    completion(imgResult.image)
                case .failure:
                    completion(nil)
                }
            }
        }
    }
    
}

extension AppImage: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .raw(let image):
            hasher.combine(image)
        case .asset(let name, _):
            hasher.combine(name)
        case .network(let url, _):
            hasher.combine(url)
        }
    }
    
    public static func == (_ lhs: AppImage, _ rhs: AppImage) -> Bool {
        switch (lhs, rhs) {
        case (.raw(let lhsImage), .raw(let rhsImage)):
            return lhsImage == rhsImage
        case (.asset(let lhsName, _), .asset(let rhsName, _)):
            return lhsName == rhsName
        case (.network(let lhsURL, _), .network(let rhsURL, _)):
            return lhsURL == rhsURL
        default:
            return false
        }
    }
}

extension AppImage: Codable {
    enum CodingKeys: String, CodingKey {
        case sourceType = "source_type"
        case imageData = "image_data"
        case assetName = "asset_name"
        case bundle = "bundle"
        case url = "url"
        case placeholderImageData = "placeholder_image_data"
    }
    
    private enum SourceType: String, Codable {
        case raw
        case asset
        case remote
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .raw(let uIImage):
            try container.encode(SourceType.raw, forKey: .sourceType)
            let data = uIImage?.jpegData(compressionQuality: 1)
            try container.encode(data, forKey: .imageData)
            
        case .asset(let string, let bundle):
            try container.encode(SourceType.asset, forKey: .sourceType)
            try container.encode(string, forKey: .assetName)
            try container.encode(bundle?.bundleIdentifier, forKey: .bundle)
            
        case .network(let uRL, let placeholder):
            try container.encode(SourceType.remote, forKey: .sourceType)
            try container.encode(uRL, forKey: .url)
            let data = placeholder?.jpegData(compressionQuality: 1)
            try container.encode(data, forKey: .placeholderImageData)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sourceType = try container.decode(SourceType.self, forKey: .sourceType)
        
        switch sourceType {
        case .raw:
            var image: UIImage?
            if let imageData = try? container.decode(Data.self, forKey: .imageData) {
                image = UIImage(data: imageData)
            }
            self = .raw(image)
            
        case .asset:
            let assetName = try container.decode(String.self, forKey: .assetName)
            var bundle: Bundle?
            if let bundleIdentifier = try? container.decode(String.self, forKey: .bundle) {
                bundle = Bundle(identifier: bundleIdentifier)
            }
            
            self = .asset(assetName, bundle: bundle)
            
        case .remote:
            let url = try container.decode(URL.self, forKey: .url)
            var placeholder: UIImage?
            if let placeholderImageData = try? container.decode(Data.self, forKey: .placeholderImageData) {
                placeholder = UIImage(data: placeholderImageData)
            }
            
            self = .network(url, placeholder: placeholder)
        }
    }
}

public extension UIImageView {
    
    
    func setImage(_ image: AppImage?) {
        guard let img = image else {
            self.image = nil
            return
        }
        switch img {
        case .raw(let optional):
            self.image = optional
        case .asset(let name, let bundle):
            self.image = UIImage(named: name, in: bundle, compatibleWith: nil)
        case .network(let url, let placeholder):
            
            self.kf.setImage(with: url, placeholder: placeholder, completionHandler:  { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        self.image = model.image
                    }
                case .failure:
                    DispatchQueue.main.async {
                        self.image = placeholder
                    }
                }
            })
            
//            self.kf.setImage(with: url, placeholder: placeholder, completionHandler:  { result in
//                switch result {
//                case .success(let model):
//                    DispatchQueue.main.async {
//                        self.image = model.image
//                    }
//                case .failure:
//                    DispatchQueue.main.async {
//                        self.image = placeholder
//                    }
//                }
//            })
        }
    }
    
}
