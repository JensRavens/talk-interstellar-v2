import UIKit
import Interstellar
import Holodeck
import XCPlayground

let page = XCPlaygroundPage.currentPage
page.needsIndefiniteExecution = true

class GreetingViewController: UIViewController {
    let textField = UITextField(frame: CGRect.zero)
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello swift.berlin"
        view.backgroundColor = .whiteColor()
        
        textField.frame = CGRect(x: 0, y: 44, width: view.bounds.width, height: 40)
        textField.placeholder = "What's your name?"
        label.frame = CGRect(x: 0, y: 88, width: view.bounds.width, height: 40)
        view.addSubview(textField)
        view.addSubview(label)
        
        textField.textObservable.map { "Hello, \($0)!" }.bind(label)
    }
}


let vc = GreetingViewController()
let navigation = UINavigationController(rootViewController: vc)

page.liveView = navigation