//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import Model
import SQLite
import Crypto

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  
  let agencyController = AgencyController()
  router.get("agencies", use: agencyController.getAgencies)
  router.post("agency", use: agencyController.postAgency)
  router.delete("agency", Int.parameter, use: agencyController.deleteAgency)
  
  let estateController = EstateController()
  router.get("estates", use: estateController.getEstates)
  router.post("estate", use: estateController.postEstate)
  router.delete("estate", Int.parameter, use: estateController.deleteEstate)
  router.get("agency", Int.parameter, "estates", use: estateController.getEstatesFromAgency)
  
  let userController = UserController()
  router.get("users", use: userController.getUsers)
  router.post("signUp", use: userController.signUp)
  router.post("user", use: userController.postUser)
  router.delete("user", Int.parameter, use: userController.deleteUser)
  router.get("agency", Int.parameter, "agents", use: userController.getAgentsFromAgency)
  router.get("agency", Int.parameter, "clients", use: userController.getClientsFromAgency)
  router.post("login", use: userController.login)
}

