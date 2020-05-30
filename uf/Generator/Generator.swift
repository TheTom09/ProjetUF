//
//  Generator.swift
//  uf
//
//  Created by Thomas Leydet on 31/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Combine
import Model

final class Generator {
  private var currentRequest: AnyCancellable?
  private var semaphore: DispatchSemaphore?
  
  private let agencyService = AgencyServiceServer()
  private let userService = UserServiceServer()
  private let estateService = EstateServiceServer()
  
  /// Nombre d'agent par agence
  let numberOfAgentByAgency = 1
  /// Nombre de client par agence
  let numberOfClientByAgency = 2
  /// Nombre de bien par client
  let numberOfEstateByClient = 2
  
  func start() {
    let decoder = JSONDecoder()
    let path = Bundle.main.path(forResource: "liste_des_prenoms", ofType: "json")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
    let records = Set(try! decoder.decode([GeneratedUser].self, from: data))
    self.createAdmin()
    let agencies = self.generateAgencies()
    self.generateUsers(agencies: agencies, records: records)
  }
  
  private func createAdmin() {
    let admin = User(id: nil,
                     type: .admin,
                     name: "Administrateur",
                     email: "admin",
                     password: "admin",
                     phone: self.randomPhone(),
                     birthdate: self.randomDate(),
                     agencyId: nil)
    _ = self.wait(self.userService.create(user: admin))
  }
  
  private func generateAgencies() -> [Agency] {
    let decoder = JSONDecoder()
    let path = Bundle.main.path(forResource: "villes", ofType: "json")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: path))
    let cities = try! decoder.decode([String].self, from: data)
    return cities.map { city in
      try! self.wait(self.agencyService.save(agency: Agency(id: nil, name: "Agence de \(city)", location: city, phone: self.randomPhone()))).get()
    }
  }
  
  private func generateUsers(agencies: [Agency], records: Set<GeneratedUser>) {
    var records = records.makeIterator()
    
    for agency in agencies {
      for _ in 0..<self.numberOfAgentByAgency {
        _ = self.createUser(record: records.next()!, type: .agent, agency: agency)
      }
      
      var idx = 0
      for _ in 0..<self.numberOfClientByAgency {
        let createdUser = self.createUser(record: records.next()!, type: .client, agency: agency)
        
        for _ in 0..<self.numberOfEstateByClient {
          let price = Int.random(in: 100000..<1000000)
          let estate = Estate(id: nil,
                              agencyId: agency.id!,
                              clientId: createdUser.id!,
                              type: idx % 2 == 0 ? .apartment : .house,
                              surface: Int.random(in: 10..<1000),
                              rooms: Int.random(in: 1..<10),
                              floor: Int.random(in: 0..<100),
                              location: "\(agency.location) \(idx + 1)",
            outbuildings: EstateOutbuilding.allCases.filter { _ in Int.random(in: 0..<2) == 0 },
            minimumPrice: price - Int.random(in: 1000..<10000),
            maximumPrice: price + Int.random(in: 1000..<10000),
            price: price,
            fees: Int.random(in: 0..<10000),
            status: idx % 2 == 0 ? .forSale : .sold)
          _ = self.wait(estateService.save(estate: estate))
          idx += 1
        }
      }
    }
  }
  
  private func createUser(record: GeneratedUser, type: UserType, agency: Agency?) -> User {
    let user = User(id: nil,
                    type: type,
                    name: "\(record.prenoms) Doe",
      email: "\(record.prenoms.lowercased())@doe.fr",
      password: "\(record.prenoms)doe",
      phone: self.randomPhone(),
      birthdate: self.randomDate(),
      agencyId: agency?.id)
    return try! self.wait(userService.create(user: user)).get()
  }
  
  private func randomDate() -> Date {
    let timestamp = TimeInterval.random(in: 0..<Date().timeIntervalSince1970)
    return Date(timeIntervalSince1970: timestamp)
  }
  
  private func randomPhone() -> String {
    String(format: "%02d %02d %02d %02d %02d", Int.random(in: 6...7), Int.random(in: 0...99), Int.random(in: 0...99), Int.random(in: 0...99), Int.random(in: 0...99))
  }
  
  private func wait<T: Publisher>(_ publisher: T) -> T.Output {
    self.semaphore = DispatchSemaphore(value: 0)
    var output: T.Output!
    self.currentRequest = publisher.sink(receiveCompletion: { _ in
      
    }, receiveValue: { value in
      output = value
      self.semaphore?.signal()
    })
    self.semaphore?.wait()
    return output
  }
}

private struct GeneratedUser: Codable, Equatable, Hashable {
  let prenoms: String
}
