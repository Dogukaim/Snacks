//
//  NetworkManager .swift
//  Snacks
//
//  Created by Dogukaim on 19.05.2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let snackURL = baseURL + "appetizers"
    private init() {}
    
    
    func getSnacks() async throws -> [Snack] {
        guard let url = URL(string: snackURL) else {
            throw APError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(SnackResponse.self, from: data).request   
        } catch {
            throw APError.invalidData
        }
    }
    
    
    
    func downloadImage(fromURLString urlString: String,completed: @escaping (UIImage?)-> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
