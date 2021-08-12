//
//  PHPhotoLibrary+Rx.swift
//  Combinestagram
//
//  Created by Mehrdad Ahmadian on 2021-08-11.
//  Copyright © 2021 Underplot ltd. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
  static var authorized: Observable<Bool> {
    return Observable.create { observer in
      DispatchQueue.main.async {
        if authorizationStatus() == .authorized {
          observer.onNext(true)
          observer.onCompleted()
        } else {
          observer.onNext(false)
          requestAuthorization { newStatus in
            observer.onNext(newStatus == .authorized)
            observer.onCompleted()
          }
        }
      }
      return Disposables.create()
    }
  }
}
