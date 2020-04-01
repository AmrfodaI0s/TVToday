//
//  AiringTodayCollectionViewModel.swift
//  MyTvShows
//
//  Created by Jeans on 10/2/19.
//  Copyright © 2019 Jeans. All rights reserved.
//

import Foundation

final class AiringTodayCollectionViewModel {
  
  private var show: TVShow
  
  public var showName: String?
  public var average: String?
  
  public var posterURL: URL? {
    return show.getbackDropPathURL()
  }
  
  // MARK: - Initializers
  
  init(show: TVShow) {
    self.show = show
    setup()
  }
  
  fileprivate func setup() {
    self.showName = show.name ?? ""
    
    if let average = show.voteAverage {
      self.average = String(average)
    }else {
      average = "0.0"
    }
  }
}
