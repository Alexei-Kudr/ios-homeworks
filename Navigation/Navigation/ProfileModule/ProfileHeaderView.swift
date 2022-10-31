//
import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Свойства
    
    let fullNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = " Full name label"
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return name
    }()
    
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "kot")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let statusLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Status label"
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return view
    }()
    
   lazy var statusTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.clipsToBounds = true
        view.placeholder = "Status text field"
        view.textAlignment = .left
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.textColor = .black
        view.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return view
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set status button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private var statusText: String = ""
    
    // MARK: - Методы
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
        print("\(statusLabel.text!)")
        endEditing(true)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = String(textField.text!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraint()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func setupConstraint() {
        self.addSubview(fullNameLabel)
        self.addSubview(avatarImageView)
        self.addSubview(statusLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusTextField)

        NSLayoutConstraint.activate([
            
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),

            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -71),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 50),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
}

