import UIKit
import Interstellar

let number = Observable(0)

number.subscribe {
    print($0)
}

number.update(5)
number.update(10)

let doubledNumber = number.map { value in
    return value * 2
}

doubledNumber.subscribe {
    print("doubled: \($0)")
}

number.update(20)
