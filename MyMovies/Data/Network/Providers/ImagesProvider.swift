//
//  ImagesProvider.swift
//  TVToday
//
//  Created by Jeans on 10/14/19.
//  Copyright © 2019 Jeans. All rights reserved.
//

import Foundation

enum ImagesProvider {
  case getPoster(PosterSize, String)
  case getBackDrop(BackDropSize, String)
}

extension ImagesProvider: EndPoint {
  
  var path: String {
    switch self {
    case .getPoster(let size, let path):
      return "/t/p/\(size.rawValue)\(path)"
    case .getBackDrop(let size, let path):
      return "/t/p/\(size.rawValue)\(path)"
    }
  }
  
  var queryParameters: [String : Any] {
    return [:]
  }
  
  var method: ServiceMethod {
    return .get
  }
}
