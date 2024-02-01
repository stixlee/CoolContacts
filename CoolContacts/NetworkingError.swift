//
//  NetworkingError.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

enum NetworkingError: Error {
    case invalidUrl
    case invalidRequest
    case invalidResponse(response: URLResponse)
    case responseError(response: HTTPURLResponse)
    case invalidJSON(decodingError: DecodingError)
    case unknown(error: Error)
    case tooManyRequests
}

extension NetworkingError: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "Attempting to call an invalid URL"
        case .invalidRequest:
            return "The network request was invalid or malformed"
        case .invalidResponse(let response):
            return "\(response)"
        case .responseError(let response):
            return "\(response)"
        case .invalidJSON(let decodingError):
            switch decodingError {
            case .keyNotFound(let key, let context):
                return "Could not find key \(key) in JSON: \(context.debugDescription)"
            default:
                return "JSON Decoding Error"
            }
        case .unknown(let error):
            return error.localizedDescription
        case .tooManyRequests:
            return "Server status 429 - Too Many Requests"
        }
    }
}
