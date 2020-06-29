//
//  DefaultAccountRepository.swift
//  TVToday
//
//  Created by Jeans Ruiz on 6/21/20.
//  Copyright © 2020 Jeans. All rights reserved.
//

import RxSwift
import Networking
import Shared

public final class DefaultAccountRepository {
  
  private let dataTransferService: DataTransferService
  
  public init(dataTransferService: DataTransferService) {
    self.dataTransferService = dataTransferService
  }
}

// MARK: - AuthRepository

extension DefaultAccountRepository: AccountRepository {
  
  public func getAccountDetails(session: String) -> Observable<AccountResult> {
    let endPoint = AccountProvider.accountDetails(sessionId: session)
    return dataTransferService.request(endPoint, AccountResult.self)
  }
  
//  public func markAsFavorite(session: String, userId: String, tvShowId: Int, favorite: Bool) -> Observable<StatusResult> {
//    let endPoint = AccountProvider.markAsFavorite(
//      userId: userId,
//      tvShowId: tvShowId,
//      sessionId: session,
//      favorite: favorite)
//    return dataTransferService.request(endPoint, StatusResult.self)
//  }
//
//  public func saveToWatchList(session: String, userId: String, tvShowId: Int, watchedList: Bool) -> Observable<StatusResult> {
//    let endPoint = AccountProvider.savetoWatchList(
//      userId: userId,
//      tvShowId: tvShowId,
//      sessionId: session,
//      watchList: watchedList)
//    return dataTransferService.request(endPoint, StatusResult.self)
//  }
}