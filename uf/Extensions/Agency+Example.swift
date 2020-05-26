//
//  Agency+Example.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Foundation
import Model

extension Array where Element == Agency {
  static var agencyListExample: [Agency] { [
      Agency(id: 0, name: "Agence Paris", location: "Paris", phone: "06 00 00 00 00"),
      Agency(id: 1, name: "Agence Marseille", location: "Marseille", phone: "06 01 01 01 01"),
      Agency(id: 2, name: "Agence Lyon", location: "Lyon", phone: "06 02 02 02 02"),
      Agency(id: 3, name: "Agence Toulouse", location: "Toulouse", phone: "06 03 03 03 03"),
      Agency(id: 4, name: "Agence Nice", location: "Nice", phone: "06 04 04 04 04"),
      Agency(id: 5, name: "Agence Nantes", location: "Nantes", phone: "06 05 05 05 05"),
      Agency(id: 6, name: "Agence Montpellier", location: "Montpellier", phone: "06 06 06 06 06"),
      Agency(id: 7, name: "Agence Strasbourg", location: "Strasbourg", phone: "06 07 07 07 07"),
      Agency(id: 8, name: "Agence Bordeaux", location: "Bordeaux", phone: "06 08 08 08 08"),
      Agency(id: 9, name: "Agence Lille", location: "Lille", phone: "06 09 09 09 09"),
      
      Agency(id: 10, name: "Agence Rennes", location: "Rennes", phone: "06 10 10 10 10"),
      Agency(id: 11, name: "Agence Reims", location: "Reims", phone: "06 11 11 11 11"),
      Agency(id: 12, name: "Agence Saint-Etienne", location: "Saint-Etienne", phone: "06 12 12 12 12"),
      Agency(id: 13, name: "Agence Toulon", location: "Toulon", phone: "06 13 13 13 13"),
      Agency(id: 14, name: "Agence Le Havre", location: "Le Havre", phone: "06 14 14 14 14"),
      Agency(id: 15, name: "Agence Grenoble", location: "Grenoble", phone: "06 15 15 15 15"),
      Agency(id: 16, name: "Agence Dijon", location: "Dijon", phone: "06 16 16 16 16"),
      Agency(id: 17, name: "Agence Angers", location: "Angers", phone: "06 17 17 17 17"),
      Agency(id: 18, name: "Agence Nîmes", location: "Nîmes", phone: "06 18 18 18 18"),
      Agency(id: 19, name: "Agence Saint-Denis", location: "Saint-Denis", phone: "06 19 19 19 19"),
      
      Agency(id: 20, name: "Agence Villeurbanne", location: "Villeurbanne", phone: "06 20 20 20 20"),
      Agency(id: 21, name: "Agence Clermond-Ferrand", location: "Clermond-Ferrand", phone: "06 21 21 21 21"),
      Agency(id: 22, name: "Agence Le Mans", location: "Le Mans", phone: "06 22 22 22 22"),
      Agency(id: 23, name: "Agence Aix-en-Provence", location: "Aix-en-Provence", phone: "06 23 23 23 23"),
      Agency(id: 24, name: "Agence Brest", location: "Brest", phone: "06 24 24 24 24"),
      Agency(id: 25, name: "Agence Tours", location: "Tours", phone: "06 25 25 25 25"),
      Agency(id: 26, name: "Agence Amiens", location: "Amiens", phone: "06 26 26 26 26"),
      Agency(id: 27, name: "Agence Limoges", location: "Limoges", phone: "06 27 27 27 27"),
      Agency(id: 28, name: "Agence Annecy", location: "Annecy", phone: "06 28 28 28 28"),
      Agency(id: 29, name: "Agence Perpignan", location: "Perpignan", phone: "06 29 29 29 29"),
      
      Agency(id: 30, name: "Agence Boulogne", location: "Boulogne", phone: "06 30 30 30 30"),
      Agency(id: 31, name: "Agence Orléans", location: "Orléans", phone: "06 31 31 31 31"),
      Agency(id: 32, name: "Agence Metz", location: "Metz", phone: "06 32 32 32 32"),
      Agency(id: 33, name: "Agence Argenteuil", location: "Argenteuil", phone: "06 33 33 33 33"),
      Agency(id: 34, name: "Agence Rouen", location: "Rouen", phone: "06 34 34 34 34"),
      Agency(id: 35, name: "Agence Montreuil", location: "Montreuil", phone: "06 35 35 35 35"),
      Agency(id: 36, name: "Agence Mulhouse", location: "Mulhouse", phone: "06 36 36 36 36"),
      Agency(id: 37, name: "Agence Caen", location: "Caen", phone: "06 37 37 37 37"),
      Agency(id: 38, name: "Agence Saint-Paul", location: "Saint-Paul", phone: "06 38 38 38 38"),
      Agency(id: 39, name: "Agence Nancy", location: "Nancy", phone: "06 39 39 39 39"),
      
      Agency(id: 40, name: "Agence Tourcoing", location: "Tourcoing", phone: "06 40 40 40 40"),
      Agency(id: 41, name: "Agence Roubaix", location: "Roubaix", phone: "06 41 41 41 41"),
      Agency(id: 42, name: "Agence Nanterre", location: "Nanterre", phone: "06 42 42 42 42"),
      Agency(id: 43, name: "Agence Vitry", location: "Vitry", phone: "06 43 43 43 43"),
      Agency(id: 44, name: "Agence Avignon", location: "Avignon", phone: "06 44 44 44 44"),
      Agency(id: 45, name: "Agence Créteil", location: "Créteil", phone: "06 45 45 45 45"),
      Agency(id: 46, name: "Agence Poitiers", location: "Poitiers", phone: "06 46 46 46 46"),
      Agency(id: 47, name: "Agence Dunkerque", location: "Dunkerque", phone: "06 47 47 47 47"),
      Agency(id: 48, name: "Agence Aubervilliers", location: "Aubervilliers", phone: "06 48 48 48 48"),
      Agency(id: 49, name: "Agence Versailles", location: "Versailles", phone: "06 49 49 49 49")
    ]  }
}

