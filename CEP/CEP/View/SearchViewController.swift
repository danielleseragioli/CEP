
import UIKit

final class SearchViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        self.setupView()
        self.setupConstraints()
    }
    
    private lazy var cepTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "APENAS NÚMEROS"
        view.backgroundColor = .systemBackground
        view.borderStyle = .roundedRect
        view.keyboardType = .numberPad
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.setTitle("PESQUISAR", for: .normal)
        view.backgroundColor = .purple
        view.setTitleColor(.systemBackground, for: .normal)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(self.performStart), for: .touchUpInside)
        return view
    }()
    
    private lazy var logradouroLabel: UILabel = {
       let view = UILabel()
        view.frame = CGRect(x: 10.0, y: 200.0, width: UIScreen.main.bounds.size.width - 20.0, height: 80)
        view.text = "Logradouro:"
        view.textAlignment = .left
        view.numberOfLines = 2
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.isHidden = true
        view.textColor = .white
        return view
    }()
    
    private lazy var localidadeLabel: UILabel = {
       let view = UILabel()
        view.text = "Localidade:"
        view.frame = CGRect(x: 10.0, y: 250.0, width: UIScreen.main.bounds.size.width - 20.0, height: 80)
        view.textAlignment = .left
        view.numberOfLines = 2
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.isHidden = true
        view.textColor = .white
        return view
    }()
    
    private lazy var dddLabel: UILabel = {
       let view = UILabel()
        view.text = "DDD"
        view.frame = CGRect(x: 10.0, y: 300.0, width: UIScreen.main.bounds.size.width - 20.0, height: 80)
        view.textAlignment = .left
        view.numberOfLines = 2
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.isHidden = true
        view.textColor = .white
        return view
    }()
    
    private lazy var ufLabel: UILabel = {
       let view = UILabel()
        view.text = "UF:"
        view.frame = CGRect(x: 10.0, y: 350.0, width: UIScreen.main.bounds.size.width - 20.0, height: 80)
        view.textAlignment = .left
        view.numberOfLines = 2
        view.minimumScaleFactor = 0.5
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.isHidden = true
        view.textColor = .white
        return view
    }()
    

    
    private func setupView(){
        view.addSubview(self.cepTextField)
        view.addSubview(self.searchButton)
        view.addSubview(self.logradouroLabel)
        view.addSubview(self.localidadeLabel)
        view.addSubview(self.dddLabel)
        view.addSubview(self.ufLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            // cep text field ----------------------------------------------
            self.cepTextField.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.cepTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            self.cepTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.cepTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // button ----------------------------------------------
            self.searchButton.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 16),
            self.searchButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            self.searchButton.heightAnchor.constraint(equalToConstant: 50),
            self.searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),


        ])
        
               
    }

    
    @objc private func performStart(){
        
        if showAlert == false {
            APIViaCep.pesquisarCEP(cepTextField.text!) { (cep) in
                DispatchQueue.main.sync {
                    self.logradouroLabel.text = "Logradouro: \(cep.logradouro)"
                    self.localidadeLabel.text = "Localidade: \(cep.localidade)"
                    self.dddLabel.text = "DDD: \(cep.ddd)"
                    self.ufLabel.text = "UF: \(cep.uf)"
                    
                }
            }
            self.logradouroLabel.isHidden = false
            self.localidadeLabel.isHidden = false
            self.dddLabel.isHidden = false
            self.ufLabel.isHidden = false
        }
        else {
            let alert = UIAlertController(title: "CEP inválido", message: "O Cep deve conter 8 números e um valor válido", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
       
    }
    
    
    
}


