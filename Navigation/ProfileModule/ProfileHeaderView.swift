//
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Свойства
    
    private var isImageViewIncreased = false
//    определяем полупрозрачную  вью под аватаром
    
    private let imageAnimation: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeThatFits(UIScreen.main.bounds.size)
        image.backgroundColor = .white
        image.isUserInteractionEnabled = false
        image.alpha = 0.8
        image.isHidden = true
        return image
    }()
//    переменная для анимации аватара
    private var centerAvatar = CGPoint()
    
//определяем кнопку для закрытия анимации
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.tintColor = .black
        button.alpha = 0
        button.isHidden = true
        button.frame = .init(x: UIScreen.main.bounds.width - 32 , y: bounds.height + 16 , width: 20, height: 20)
      button.backgroundImage(for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let fullNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Full name label"
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return name
    }()
    
    lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "kot")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToAvatar))
//        добавляем возможность взаимодействия пользователя с аватаром
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func setupConstraint() {
        [fullNameLabel, setStatusButton, statusLabel, statusTextField,imageAnimation, avatarImageView, closeButton ].forEach({addSubview($0)})
        
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
        centerAvatar =  avatarImageView.center
    }
    
    
    @objc private func tapToAvatar(){
        let centerX = UIScreen.main.bounds.width / 2
        let centerY = UIScreen.main.bounds.height / 2
        UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
            self.imageAnimation.isHidden = false
            self.avatarImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.imageAnimation.frame.size = UIScreen.main.bounds.size
            self.avatarImageView.center.x = centerX
            self.avatarImageView.center.y = centerY
            self.avatarImageView.layer.cornerRadius = 0
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
                self.closeButton.alpha = 1
                self.closeButton.isHidden = false
                self.layoutIfNeeded()
            })
        }
        layoutIfNeeded()
    }
    
    @objc private func closeButtonTapped() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, animations: {
            self.closeButton.isHidden = true
            self.imageAnimation.isHidden = true
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.height/2
            self.avatarImageView.center.x = self.centerAvatar.x + self.avatarImageView.bounds.width/2 + 16
            self.avatarImageView.center.y = self.centerAvatar.y + self.avatarImageView.bounds.height/2 + 16
        })
    }
}

