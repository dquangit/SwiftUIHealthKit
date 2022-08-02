//
//  HealthService.swift
//  SwiftUIHealthKit
//
//  Created by Quang Pham on 02/08/2022.
//

import Foundation

protocol HealthService {
    func checkAvailability() async -> Bool
    func getUserMedicalInfo() async throws -> UserMedical?
}
