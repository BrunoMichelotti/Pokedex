//
//  GenericService.swift
//  Pokedex
//
//  Created by Bruno Michelotti on 29/08/22.
//

import UIKit
import Alamofire

protocol GenericService : AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case errorRequest(AFError)
}
