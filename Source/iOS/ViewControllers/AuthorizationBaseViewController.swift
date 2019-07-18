//
//  AuthorizationBaseViewController.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 7/13/19.
//

import UIKit

class AuthorizationBaseViewController<ContentView>: UIViewController {
    
    let scrollView = UIScrollView()
    private var scrollViewBottomConstraint: NSLayoutConstraint!
    
    var contentView: ContentView {
        didSet {
            setupContentView(contentView, oldContentView: oldValue)
        }
    }
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        
        return view
    }()
    
    private(set) var nextButtonItem: UIBarButtonItem!
    
    private let indicatorView = UIActivityIndicatorView(style: .gray)
    private lazy var processingButtonItem = UIBarButtonItem(customView: indicatorView)
    
    var isProcessing = false {
        didSet {
            if isProcessing {
                navigationItem.setRightBarButton(processingButtonItem, animated: true)
                indicatorView.startAnimating()
            } else {
                navigationItem.setRightBarButton(nextButtonItem, animated: true)
            }
            
            (contentView as? AuthorizationContentView)?.isProcessing = isProcessing
        }
    }
    
    var authorizationViewController: AuthorizationViewController? {
        return navigationController as? AuthorizationViewController
    }
    
    init(contentView: ContentView, isFinalStep: Bool) {
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
        
        if isFinalStep {
            nextButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(nextButtonTapped))
        } else {
            nextButtonItem = UIBarButtonItem(title: L.Common.Next, style: .done, target: self, action: #selector(nextButtonTapped))
        }
        
        navigationItem.rightBarButtonItem = nextButtonItem
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupScrollView()
        setupContentView(contentView, oldContentView: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIApplication.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIApplication.keyboardWillHideNotification, object: nil)
    }
    
    private func setupScrollView() {
        // to make interactive keyboard dismissing work
        scrollView.contentInset.bottom = 0.0001
        scrollView.keyboardDismissMode = .interactive
        scrollView.clipsToBounds = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let containerView = UIView()
        
        // https://stackoverflow.com/a/50767533/5089731
        [scrollView, containerView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        let containerViewHeightConstraint = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        containerViewHeightConstraint.priority = .defaultLow
        
        if #available(iOS 11.0, *) {
            scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            NSLayoutConstraint.activate([
                
                // constrain all 4 sides of the scroll view to the safe area
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollViewBottomConstraint,
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            ])
        } else {
            scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            NSLayoutConstraint.activate([
                
                // constrain all 4 sides of the scroll view to view's edges
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollViewBottomConstraint,
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
            ])
        }
        
        NSLayoutConstraint.activate([
            
            // constrain all 4 sides of the content view to the scroll view
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            // constrain width of content view to width of scroll view
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // constrain the stack view >= 8-pts from the top
            // <= minus 8-pts from the bottom
            // 40-pts leading and trailing
            stackView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // constrain stack view centerY to containerView centerY
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0.0),
            
            // activate the containerView's height constraint
            containerViewHeightConstraint,
            
        ])
    }
    
    private func setupContentView(_ contentView: ContentView, oldContentView: ContentView?) {
        if let oldContentView = oldContentView as? UIView {
            stackView.removeArrangedSubview(oldContentView)
            oldContentView.removeFromSuperview()
        }
        
        if let contentView = contentView as? UIView {
            stackView.addArrangedSubview(contentView)
        }
    }
    
    // MARK: - Actions
    
    @objc func nextButtonTapped() {
    }
    
    @objc private func cancelButtonTapped() {
        authorizationViewController?.cancelButtonTapped()
    }
    
    // MARK: - Keyboard
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        handleKeyboard(notification: notification, willShow: true)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        handleKeyboard(notification: notification, willShow: false)
    }
    
    private func handleKeyboard(notification: Notification, willShow: Bool) {
        guard let window = view.window,
            
            let userInfo = notification.userInfo,
            
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject?)?.cgRectValue,
            
            let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            
            let animationCurve = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue else {
                
                return
        }
        
        let keyboardHeight = window.frame.intersection(keyboardFrame).height
        
        scrollViewBottomConstraint.constant = -keyboardHeight
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: .init(rawValue: UInt(animationCurve)), animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}
