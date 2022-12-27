//

import UIKit

final class PostViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupBarLabelItem()
        setupBarButtonItem()
    }
    
    func setupBarLabelItem() {
        self.navigationItem.title = postComplex.title
    }
    
    func setupBarButtonItem() {
        let baritem = UIBarButtonItem(image: UIImage(systemName: "bubble.right"), style: .plain, target: self, action: #selector(addTarget))
        self.navigationItem.rightBarButtonItem = baritem
    }
    
    @objc func addTarget(){
        let infoViewController = InfoViewController()
        navigationController?.present(infoViewController, animated: true)
    }
}
