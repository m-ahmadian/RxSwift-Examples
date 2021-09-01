import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

playgroundShouldContinueIndefinitely()

// MARK: - Chapter 9 - Combining Operators

// MARK: - Prefixing and concatenating

example(of: "startWith") {
    // 1
    let numbers = Observable.of(2, 3, 4)

    // 2
    let observable = numbers.startWith(1)
    _ = observable.subscribe(onNext: {value in
        print(value)
    })
}

example(of: "Observable.concat") {
    // 1
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)

    // 2
    let observable = Observable.concat([first, second])

    observable.subscribe(onNext: { value in
        print(value)
    })
}

example(of: "concat") {
    let germanCities = Observable.of("Berlin", "Munich", "Frankfurt")
    let spanishCities = Observable.of("Madrid", "Barcelona", "Valencia")

    let observable = germanCities.concat(spanishCities)
    _ = observable.subscribe(onNext: { value in
        print(value)
    })
}

example(of: "concatMap") {
    // 1
    let sequences = [
        "German cities": Observable.of("Berlin", "Munich", "Frankfurt"),
        "Spanish cities": Observable.of("Madrid", "Barcelona", "Valencia")
    ]

    // 2
    let observable = Observable.of("German cities", "Spanish cities")
        .concatMap { country in
            sequences[country] ?? .empty()
    }

    // 3
    _ = observable.subscribe(onNext: { string in
        print(string)
    })
}

// MARK: - Merging

example(of: "merge") {
    // 1
    let left = PublishSubject<String>()
    let right = PublishSubject<String>()

    // 2
    let source = Observable.of(left.asObservable(), right.asObservable())

    // 3
    let observable = source.merge()
    let _ = observable.subscribe(onNext: { value in
        print(value)
    })

    // 4
    var leftValues = ["Berlin", "Munich", "Frankfurt"]
    var rightValues = ["Madrid", "Barcelona", "Valencia"]
    repeat {
        switch Bool.random() {
        case true where !leftValues.isEmpty:
            left.onNext("Left: " + leftValues.removeFirst())
        case false where !rightValues.isEmpty:
            right.onNext("Right: " + rightValues.removeFirst())
        default:
            break
        }
    } while !leftValues.isEmpty || !rightValues.isEmpty

    // 5
    left.onCompleted()
    right.onCompleted()
}

/*:
 Copyright (c) 2019 Razeware LLC
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 distribute, sublicense, create a derivative work, and/or sell copies of the
 Software in any work that is designed, intended, or marketed for pedagogical or
 instructional purposes related to programming, coding, application development,
 or information technology.  Permission for such use, copying, modification,
 merger, publication, distribution, sublicensing, creation of derivative works,
 or sale is expressly withheld.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
