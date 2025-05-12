//
//  NetworkManager.swift
//  SubFeeds
//
//  Created by Thomas on 2025/2/19.
//

import Foundation


enum NetworkError: Error {
    case invalidURL          // 无效的 URL
    case invalidResponse     // 无效的响应（例如，状态码不为 200）
    case noData              // 无返回数据
}

class NetworkManager {
    
    /**
     发起网络请求并解析返回的数据

     - 该方法通过 URL 字符串发起网络请求，下载数据并尝试将其解析为指定的模型类型。
     - 如果请求或解析过程中发生任何错误，错误会通过回调返回。
     - 成功时，解析后的数据将通过回调传递。

     - Parameters:
        - urlString: 请求的 URL 字符串，必须是有效的 URL。
        - completion: 请求完成后的回调闭包。返回一个 `Result` 类型的结果，
                      - `.success(T)` 包含解析后的模型数据。
                      - `.failure(Error)` 包含错误信息。
     - Throws:
        - 无，所有的错误通过回调返回。
     
     - Example:
        ```swift
        NetworkManager.fetchData(from: "https://api.example.com/user") { (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                print("User name: \(user.name)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        ```
     */
    static func fetchData<T: Codable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        // 检查传入的 URL 字符串是否有效
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL)) // 如果无效，返回 invalidURL 错误
            return
        }
        
        // 使用 URLSession 发起网络请求
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // 处理请求过程中可能发生的错误
            if let error = error {
                completion(.failure(error)) // 请求出错时，返回错误
                return
            }
            
            // 检查 HTTP 响应状态码，只有 200（成功）才视为有效响应
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse)) // 状态码不是 200 时返回错误
                return
            }
            
            // 检查返回的数据是否有效
            guard let data = data else {
                completion(.failure(NetworkError.noData)) // 如果没有数据，返回错误
                return
            }
            
            // 使用 JSONDecoder 解码数据为指定的模型类型
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData)) // 如果解码成功，返回结果
            } catch {
                completion(.failure(error)) // 如果解码失败，返回错误
            }
        }
        
        // 启动请求任务
        task.resume()
    }
}
