//
//  UIViewController Extension.swift
//  Combinestagram
//
//  Created by Mehrdad Ahmadian on 2021-08-09.
//  Copyright © 2021 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func showAlert(_ title: String, description: String?) -> Completable {
    return Completable.create { [weak self] completable in
      let alertVC = UIAlertController(title: title, message: description, preferredStyle: .alert)
      let action = UIAlertAction(title: "Close", style: .default) {_ in
        completable(.completed)
      }
      alertVC.addAction(action)
      self?.present(alertVC, animated: true, completion: nil)
      return Disposables.create()
    }
  }
}
