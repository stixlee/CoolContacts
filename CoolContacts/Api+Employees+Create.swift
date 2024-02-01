//
//  Api+Employees+Create.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

extension Api: ApiCreating {
    
    func addEmployee(employee: Employee) async throws -> Bool {
        
        let baseUrlString = "https://dummy.restapiexample.com/api/v1/create"
        guard let url = URL(string: baseUrlString) else { return false }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(AddEmployeeDao(from: employee)) else {
            return false
        }
        request.httpBody = data
        
        let (responseData, response) = try await URLSession.shared.data(for: request)
        
        print(String(decoding: responseData, as: UTF8.self))

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse(response: response)
        }

        guard httpResponse.statusCode == 200 else {
            throw NetworkingError.responseError(response: httpResponse)
        }

        return true
    }
    
}
