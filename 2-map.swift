import UIKit
import Interstellar

func greet(name: String) -> String {
    return "Hello \(name)"
}

let name = Observable<String>()

let greeting = name.map(greet)

greeting.subscribe { string in
    print(string)
}

name.update("Jens")
