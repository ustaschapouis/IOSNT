//
//  LoginViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 08.09.2021.
//

import UIKit


class LoginViewController: UIViewController {
    
    private let color = UIColor(patternImage: UIImage(named: "blue_pixel")!)
    private lazy var loginButton: MyCustomButton = {
        let button = MyCustomButton(title: "Login", color: color, target: tap)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var generatePassButton: MyCustomButton = {
        let button = MyCustomButton(title: "Generate password", color: .black) {
            self.toGenerate()
        }
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let currentUser = CurrentUserService()
    private let testUser = TestUserService()
    
    var delegate: LoginViewControllerDelegate?
    var coordinator: Coordinator?
    let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    let userTextField: UITextField = {
        let userField = UITextField()
        userField.placeholder = "Email or phone"
        userField.textColor = .black
        userField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userField.autocapitalizationType = .none
        userField.tintColor = UIColor.init(named: "color")
        userField.backgroundColor = .systemGray6
        userField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userField.frame.height))
        userField.leftViewMode = .always
        userField.layer.borderColor = UIColor.lightGray.cgColor
        userField.layer.borderWidth = 0.5
        userField.translatesAutoresizingMaskIntoConstraints = false
        return userField
    }()
    
    let passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.textColor = .black
        passwordField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordField.autocapitalizationType = .none
        passwordField.tintColor = UIColor.init(named: "color")
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = .systemGray6
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordField.frame.height))
        passwordField.leftViewMode = .always
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.borderWidth = 0.5
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    let scrollView = UIScrollView()
    let userPasswordView = UIView()
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        userPasswordView.translatesAutoresizingMaskIntoConstraints = false
        userPasswordView.layer.borderColor = UIColor.lightGray.cgColor
        userPasswordView.layer.borderWidth = 0.5
        userPasswordView.layer.cornerRadius = 10
        userPasswordView.clipsToBounds = true
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.keyboardDismissMode = .onDrag
        contentView.addSubview(userPasswordView)
        contentView.addSubview(loginButton)
        contentView.addSubview(logoImage)
        contentView.addSubview(generatePassButton)
        userPasswordView.addSubview(userTextField)
        userPasswordView.addSubview(passwordTextField)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            userPasswordView.heightAnchor.constraint(equalToConstant: 100),
            userPasswordView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            userPasswordView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            userPasswordView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            userTextField.topAnchor.constraint(equalTo: userPasswordView.topAnchor),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            userTextField.widthAnchor.constraint(equalTo: userPasswordView.widthAnchor),
            userTextField.bottomAnchor.constraint(equalTo: userPasswordView.bottomAnchor, constant: -50),
            
            passwordTextField.bottomAnchor.constraint(equalTo: userPasswordView.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalTo: userPasswordView.widthAnchor),
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor),
            
            loginButton.topAnchor.constraint(equalTo: userPasswordView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
            generatePassButton.centerXAnchor.constraint(equalTo: logoImage.centerXAnchor),
            generatePassButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50)
        ])
    }
    private func passwordGeneration() -> String {
        let smth = 6
        let passwordChars = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        let randomPassword = String((0..<smth).map{ _ in passwordChars[Int(arc4random_uniform(UInt32(passwordChars.count)))]})
        print(randomPassword)
        return randomPassword
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc func tap() {
#if DEBUG
        
        if let enteredName = userTextField.text, (testUser.returnUser(userName: enteredName) != nil) {
            let profileVC = ProfileViewController(userService: testUser, enteredUserName: enteredName)
            navigationController?.pushViewController(profileVC, animated: true)
            print("Correct Login")
        } else {
            print("WRONG LOGIN!!!")
        }
        
#else
        if let enterdName = userTextField.text, (currentUser.returnUser(userName: enterdName) != nil) {
            let profileVC = ProfileViewController(userService: currentUser, enteredUserName: enterdName)
            navigationController?.pushViewController(profileVC, animated: true)
            print("Correct login")
        } else {
            print("WRONG LOGIN!!!")
        }
        
#endif
    }
    
    @objc func toGenerate() {
        let activity = UIActivityIndicatorView(style: .medium)
        contentView.addSubview(activity)
        activity.center = contentView.center
        activity.startAnimating()
        let bruteForce = BruteForce()
        let passUnlock = self.passwordGeneration()
        let queue = OperationQueue()
        queue.addOperation {
            let password = bruteForce.bruteForce(passwordToUnlock: passUnlock)
            OperationQueue.main.addOperation {
                self.passwordTextField.isSecureTextEntry = false
                self.passwordTextField.text = password
                activity.stopAnimating()
                activity.hidesWhenStopped = true
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}





