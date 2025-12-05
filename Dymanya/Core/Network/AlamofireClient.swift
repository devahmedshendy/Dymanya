//
//  AlamofireClient.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 08/07/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireClient: APIClient {

    private typealias Err = APIError

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return decoder
    }()

    // MARK: Requests

    func get<T: Encodable>(_ request: T) async throws -> T.Response where T: APIRequest, T.Response: APIResponse {
        let afTask = AF.request(
            request.url,
            method: .get,
            parameters: request.data,
            encoder: URLEncodedFormParameterEncoder(
                encoder: .init(),
                destination: .queryString
            ),
            headers: HTTPHeaders(request.headers),
        ).serializingDecodable(T.Response.self, decoder: decoder)

        return try await processAlamofireTask(afTask)
    }

    func post<T: Encodable>(_ request: T) async throws -> T.Response where T: APIRequest, T.Response: APIResponse {
        let afTask = AF.request(
            request.url,
            method: .post,
            parameters: request.data,
            encoder: JSONParameterEncoder.default,
            headers: HTTPHeaders(request.headers),
        ).serializingDecodable(T.Response.self, decoder: decoder)

        return try await processAlamofireTask(afTask)
    }

    // MARK: Helpers

    private func processAlamofireTask<Response: Decodable>(
        _ afTask: DataTask<Response>
    ) async throws -> Response {
        let afResponse = await afTask.response
        let afResult = afResponse.result

        if let data = afResponse.data {
            debugJSON(data)
        }

        switch afResult {
        case .success(let response):
            return response

        case .failure(let error):
            debugPrint(afResponse)
            let error = handleAFError(error)

            throw error
        }
    }

    private func handleAFError(_ error: AFError) -> Err {
        return switch error {
        case .sessionTaskFailed(let error as NSError):
            switch error.code {
            case NSURLErrorTimedOut:
                Err.RequestTimeOut(error.debugDescription)

            case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
                Err.NoNetworkConnection(error.debugDescription)

            default:
                Err.NetworkError(error.debugDescription)
            }

        case .responseSerializationFailed(let reason):
            switch reason {
            case .jsonSerializationFailed(let error as NSError),
                    .decodingFailed(let error as NSError),
                    .customSerializationFailed(let error as NSError):
                Err.FailedResponseSerialization(error.debugDescription)

            default:
                {
                    let error = error as NSError
                    return Err.FailedResponseSerialization(error.debugDescription)
                }()
            }

        case .invalidURL(let url):
            {
                if let url = try? url.asURL() {
                    return Err.InvalidUrl(url.absoluteString)
                } else {
                    let error = error as NSError
                    return Err.FailedRequest(error.debugDescription)
                }
            }()

        default:
            {
                let error = error as NSError
                return Err.FailedRequest(error.debugDescription)
            }()
        }
    }
}
