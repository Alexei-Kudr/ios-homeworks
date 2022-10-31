//
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Свойства
    
    var profileHeaderView = ProfileHeaderView()
    
    
    let changeTitle: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Title", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    // MARK: - Жизненый цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }
    
    // MARK: - Методы
    
    func setupUI() {
        view.backgroundColor = .lightGray
        self.navigationItem.title = "Profile"
    }
    
    func setupConstraint() {
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitle)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            changeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTitle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            changeTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
