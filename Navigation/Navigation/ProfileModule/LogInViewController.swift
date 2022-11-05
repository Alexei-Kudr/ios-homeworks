//
//  LoginViewController.swift
//  UIScrollViewDemo
//
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Свойства

    class CustomButton: UIButton {
        override var isHighlighted: Bool {
            didSet {
                if (isHighlighted) {
                    alpha = 0.8
                } else {
                    alpha = 1
                }
            }
        }
        override var isSelected: Bool {
            didSet {
                if (isSelected) {
                    alpha = 0.8
                } else {
                    alpha = 1
                }
            }
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.clipsToBounds = true
        logo.layer.shouldRasterize = true
        return logo
    }()
    
    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.tag = 0
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.backgroundColor = .systemGray6
        login.borderStyle = .roundedRect
        login.layer.borderWidth = 0.5
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.placeholder = "Email or phone"
        login.autocapitalizationType = .none
        login.clearButtonMode = .whileEditing
        login.clipsToBounds = true
        login.layer.cornerRadius = 10
        login.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        login.delegate = self
        return login
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.tag = 1
        password.backgroundColor = .systemGray6
        password.borderStyle = .roundedRect
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.placeholder = "Password"
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.delegate = self
        
        return password
    }()
    
    private lazy var button: CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3168755174, green: 0.5064481497, blue: 0.7199961543, alpha: 1)
        button.imageView?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
 
    private var login: String?
   
    // MARK: - Жизненный цикл

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true //скрыть 
        self.view.backgroundColor = .white
        self.setupGestures()
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.scrollView.addSubview(self.button)
        self.scrollView.addSubview(self.logoImage)
        let scrollViewConstraints = self.scrollViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let buttonConstraints = self.buttonConstraints()
        let logoConstraints = self.logoConstraints()
        
        NSLayoutConstraint.activate(
            scrollViewConstraints +
            stackViewConstraints +
            buttonConstraints +
            logoConstraints
        )
        
    }
 
//Распознаватель жестов тап
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
//view будет появляться
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
 //сonstraints
    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.scrollView.topAnchor.constraint(equalTo:  self.view.topAnchor)
        let leadingAnchor = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingAnchor = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, bottomAnchor
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.stackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        
        return [
            topAnchor, leadingConstraint, trailingConstraint, heightConstraint
        ]
    }
    
    private func logoConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.logoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let widthConstraint = self.logoImage.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = self.logoImage.heightAnchor.constraint(equalToConstant: 100)
        let centerXAnchor = self.logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        return [
            topAnchor, widthConstraint, centerXAnchor, heightConstraint
        ]
    }
    
    private func buttonConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.button.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let leadingConstraint = self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightConstraint = self.button.heightAnchor.constraint(equalToConstant: 50)
        
        return [
            topAnchor, leadingConstraint, trailingConstraint, heightConstraint
        ]
    }
    
    @objc
    private func logInButtonPressed() {
        let postViewController = ProfileViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY =  self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 0 {
            self.login = textField.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}
