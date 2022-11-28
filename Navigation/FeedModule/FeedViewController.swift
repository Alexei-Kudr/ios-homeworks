//

import UIKit

final class FeedViewController: UIViewController {
   
    var postStruct = Post(title: "Post #1", message: "Hello! This is my first post!")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        addTargets()
        view.addSubview(postButton)
        view.backgroundColor = .white
        view.addSubview(blueButton)
        view.addSubview(greenButton)
        view.addSubview(stackView)
        stackView.addArrangedSubview(blueButton)
        stackView.addArrangedSubview(greenButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private let stackView: UIStackView = { //стек
        let stackView = UIStackView()
        stackView.axis = .vertical  //ось вертикально
        stackView.spacing = 20 //расстояние
        stackView.alignment = .center //выравнивание
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Blue Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Green Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: screenSize.width / 2 - 120, y: screenSize.height / 1.2 - 30, width: 240, height: 60))
        button.setTitle("Show post", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = screenSize.height / 15 / 3
        button.backgroundColor = #colorLiteral(red: 0.09288740903, green: 0.5254676342, blue: 1, alpha: 1)
        return button
    }()
    
    func addTargets() {
        blueButton.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(showDetailController), for: .touchUpInside)
    }
    
    @objc func showDetailController() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    

}
