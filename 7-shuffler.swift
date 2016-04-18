import UIKit
import Interstellar
import Holodeck
import XCPlayground

let page = XCPlaygroundPage.currentPage
page.needsIndefiniteExecution = true

class NumberCell: UITableViewCell, ModelCell {
    static let identifier = "Cell"
    
    func updateModel(model: Int) {
        textLabel?.text = String(model)
    }
}

class TableViewController: UIViewController {
    let tableView = UITableView()
    let numbers = Observable([0, 1, 1, 2, 3, 5, 8])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello swift.berlin"
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        numbers.bind(tableView.createAdapter(NumberCell.self))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(TableViewController.shuffle))
    }
    
    func shuffle() {
        var rotated = numbers.peek()!
        let last = rotated.removeLast()
        rotated.insert(last, atIndex: 0)
        numbers.update(rotated)
    }
}


let vc = TableViewController()
let navigation = UINavigationController(rootViewController: vc)

page.liveView = navigation