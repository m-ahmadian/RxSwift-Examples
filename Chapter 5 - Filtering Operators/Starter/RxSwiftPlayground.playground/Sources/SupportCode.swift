import Dispatch

/**
 Encloses each code example in its own scope. Prints a `description` header and then executes the `action` closure.
 – parameter description: example description
 – parameter action: `Void` closure
 */

public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
  action()
}

//public func example(_ description: String, action: () -> Void) {
//    printExampleHeader(description)
//    action()
//}
public func printExampleHeader(_ description: String) {
    print("\n— \(description) example —")
}

public enum TestError: Swift.Error {
    case test
}


/**
 Executes `closure` on main thread after `delay` seconds.
 – parameter delay: time in seconds to wait before executing `closure`
 – parameter closure: `Void` closure
 */
public func delay(_ delay: Double, closure: @escaping () -> Void) {

    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

#if NOT_IN_PLAYGROUND

    public func playgroundShouldContinueIndefinitely() { }

#else

    import PlaygroundSupport

    public func playgroundShouldContinueIndefinitely() {
        PlaygroundPage.current.needsIndefiniteExecution = true
    }

#endif

/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.
