import UIKit
import Interstellar

func failMaybe(int: Int) throws -> Int {
    return int
}

func failMaybeLater(int: Int) -> Observable<Result<Int>> {
    return Observable(.Success(5))
}

func doLater(int: Int) -> Observable<Int> {
    return Observable(int)
}

let number = Observable(5)

let transformedNumber = number.map(failMaybe)

transformedNumber.subscribe { value in
    print(value)
}

transformedNumber.next { value in
    print(value)
}

transformedNumber.error { error in
    print(error)
}

let thirdNumber = transformedNumber.then(failMaybeLater)

let fourthNumber = thirdNumber.then(doLater)