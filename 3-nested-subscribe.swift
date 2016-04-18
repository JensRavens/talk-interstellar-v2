import UIKit
import Interstellar
import Holodeck
import XCPlayground

let page = XCPlaygroundPage.currentPage
page.needsIndefiniteExecution = true

func doubleAsync(number: Int) -> Observable<Int> {
    let observable = Observable<Int>(options: [.Once])
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
        sleep(1) // expensive computation
        dispatch_async(dispatch_get_main_queue()) {
            observable.update(number * 2)
        }
    }
    return observable
}

let myNumber = Observable(5)

myNumber.map(doubleAsync).subscribe { i in
    i.subscribe { value in
        print(value)
    }
}

myNumber.flatMap(doubleAsync).subscribe { value in
    print(value)
}
