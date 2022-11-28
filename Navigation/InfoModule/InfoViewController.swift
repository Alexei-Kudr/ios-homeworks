//

import UIKit

final class InfoViewController: UIViewController {
    
    let post = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        addTargets()
        setupAlertConfiguration()
        view.addSubview(infoButton)
    }
    
    private let infoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenSize.width / 2 - 120, y: screenSize.height / 2 - 30, width: 240, height: 60))
        button.setTitle("Show info", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = screenSize.height / 15 / 3
        button.backgroundColor = #colorLiteral(red: 0.09288740903, green: 0.5254676342, blue: 1, alpha: 1)
        return button
    }()
    
    func addTargets() {
        infoButton.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
    }
    
    let alertController = UIAlertController(title: postComplex.title, message: postComplex.message, preferredStyle: .alert)
    
    func setupAlertConfiguration() {
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("You pushed OK")
        }))
        alertController.addAction(UIAlertAction(title: "Get info", style: .default, handler: { _ in
            print("Some information")
        }))
    }
    
    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
    
}
