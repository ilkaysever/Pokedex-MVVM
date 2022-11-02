//
//  NetworkManager.swift
//  Pokedex
//
//  Created by İlkay Sever on 1.11.2022.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    static func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        
        //fetchNewsData(category: String?, query: String?, completion: @escaping(NewsModel) -> Void, error: @escaping(ResponseError) -> Void)
        
        AF.request(url, method: method).response { response in
            
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data!) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.unknownError))
            }
            
//            switch response.result {
//            case .success:
//                do {
//                    let newsData = try JSONDecoder().decode(NewsModel.self, from: response.data!)
//                    completion(newsData)
//                } catch {
//                    debugPrint("********************* Error Decoding = \(error.localizedDescription) *********************")
//                }
//            case .failure(let error):
//                debugPrint("********************* \(error.localizedDescription) *********************")
//            }
        }
        
        
    }
    
    private static func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
}
