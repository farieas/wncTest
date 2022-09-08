//
//  Network.swift
//  MachineTest
//
//  Created by WC-64 on 08/09/22.
//  Copyright © 2022 organistation. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static let shared = Network()
    
    private init(){}
    
    func performRequest<T:Codable>(url:URL,model:T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation({ continuation in
            AF.request(url,method: .get).responseDecodable { (response: DataResponse<T,AFError>)  in
                debugPrint("======== Response ===========")
                debugPrint(response)
                debugPrint("======== End ===========")
                switch response.result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    func fetchData() async -> Home? {
        do {
           let data = try await performRequest(url: URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")!,
                                     model: Home.self)
            return data
        } catch (let error) {
            // .. handle error
            print("fetchData error \(error.localizedDescription)")
        }
        return nil
    }
}
