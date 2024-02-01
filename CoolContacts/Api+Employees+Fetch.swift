//
//  Api+Employees+Fetch.swift
//  CoolContacts
//
//  Created by Michael Lee on 1/31/24.
//

import Foundation

extension Api {
    
    func fetchEmployees() async throws -> EmployeesResponseDAO {
        
        let baseUrlString = "https://dummy.restapiexample.com/api/v1/employees"
        guard let  url = URL(string: baseUrlString) else {
            print("DEBUG: \(NetworkingError.invalidUrl.localizedDescription)")
            throw NetworkingError.invalidUrl
        }
        
        guard let  url = URL(string: baseUrlString) else {
            throw NetworkingError.invalidUrl
        }
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse(response: response)
        }
        
        print("Status Code: \(httpResponse.statusCode)")
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkingError.responseError(response: httpResponse)
        }
        
        do {
            let employees = try JSONDecoder().decode(EmployeesResponseDAO.self, from: data)
            return employees
        } catch let error as DecodingError {
            switch error {
            case .typeMismatch(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .valueNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .dataCorrupted(let key):
              print("error \(key), and ERROR: \(error.localizedDescription)")
            default:
              print("ERROR: \(error.localizedDescription)")
            }
            throw NetworkingError.unknown(error: error)
        } catch {
            throw NetworkingError.unknown(error: error)
        }
    }
    
    func fetchEmployee(id: Int) async throws -> EmployeeResponseDAO {
        
        let baseUrlString = "https://dummy.restapiexample.com/api/v1/employee"
        guard let  url = URL(string: "\(baseUrlString)/\(id)") else {
            print("DEBUG: \(NetworkingError.invalidUrl.localizedDescription)")
            throw NetworkingError.invalidUrl
        }
        print("url: \(url.absoluteString)")
        
        let request = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.invalidResponse(response: response)
        }
        
        if httpResponse.statusCode == 429 {
            throw NetworkingError.tooManyRequests
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkingError.responseError(response: httpResponse)
        }
        
        do {
            let employee = try JSONDecoder().decode(EmployeeResponseDAO.self, from: data)
            return employee
        } catch let error as DecodingError {
            switch error {
            case .typeMismatch(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .valueNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
              print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .dataCorrupted(let key):
              print("error \(key), and ERROR: \(error.localizedDescription)")
            default:
              print("ERROR: \(error.localizedDescription)")
            }
            print()
            throw NetworkingError.unknown(error: error)
        } catch {
            throw NetworkingError.unknown(error: error)
        }    }
}
