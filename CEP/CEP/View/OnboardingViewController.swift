
import UIKit

final class OnboardingViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bgCity")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var startButton: UIButton = {
        let view = UIButton()
        view.setTitle("COMEÇAR", for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(self.performStart), for: .touchUpInside)
        return view
    }()

    private lazy var textOnboarding: UILabel = {
       let view = UILabel()
        view.text = """
Pesquise os principais
dados de um CEP
"""
        
        view.textAlignment = .center
        view.numberOfLines = 2
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        view.textColor = .white
        return view
    }()
    
    
    private func setupView(){
        view.addSubview(self.backgroundImageView)
        view.addSubview(self.startButton)
        view.addSubview(self.textOnboarding)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // background ----------------------------------------------
            self.backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor),
            self.backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            // button  ----------------------------------------------
            self.startButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            self.startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.startButton.heightAnchor.constraint(equalToConstant: 50),
            
            // label  ---------------------------------------------
            self.textOnboarding.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.textOnboarding.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
            self.textOnboarding.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.textOnboarding.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
        
        setWidthHeightTranslate(subview: textOnboarding, width: UIScreen.main.bounds.size.width - 20.0, height: 80)
    }
    
    func setWidthHeightTranslate (subview: UIView, width: CGFloat, height: CGFloat){
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalToConstant: width).isActive = true
        subview.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    @objc private func performStart(){
        let rootVC = SearchViewController()
        rootVC.title = "Informe o CEP"
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
}

