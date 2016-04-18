import UIKit
import Interstellar
import Holodeck
import XCPlayground

let page = XCPlaygroundPage.currentPage
page.needsIndefiniteExecution = true

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
button.setTitle("Click me", forState: .Normal)

page.liveView = button

var counter = 0

func count() -> Int {
    counter += 1
    return counter
}

extension UIButton: ModelUpdateable {
    public func updateModel(model: String) {
        setTitle(model, forState: .Normal)
    }
}

button.tap.map(count).map(String.init).delay(0.5).bind(button)
