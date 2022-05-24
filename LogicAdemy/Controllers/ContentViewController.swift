//
//  ContentViewController.swift
//  LogicAdemy
//
//  Created by jpcm2 on 18/05/22.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet var contentTitleLabel: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet var contentTextLabel: UILabel!
    
    
    var mainTitle: String?
    var contentText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContentLabels()
        setBg()
    }
    
    func setBg(){
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            self.view.backgroundColor = darkBg
        }else{
            self.view.backgroundColor = normalBg
        }
    }
    
    func setContentLabels(){
        contentTitleLabel.text = mainTitle
        contentTextLabel.text = contentText
        
        contentTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = secondaryColor
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 8
        contentView.layer.shadowOffset = CGSize(width: 0, height: 6)
        contentView.layer.borderWidth = 0.8
        contentView.layer.borderColor = primaryColorCG
        
        contentTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        contentTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        contentTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        contentTitleLabel.textAlignment = .center
        contentTitleLabel.font = contentTitleLabel.font.withSize(titleSize)
        contentTitleLabel.textColor = primaryColor
        
        contentTextLabel.topAnchor.constraint(equalTo: contentTitleLabel.bottomAnchor, constant: 40).isActive = true
        contentTextLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        contentTextLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        contentTextLabel.textAlignment = .center
        contentTextLabel.textColor = primaryColor
        contentTextLabel.font = contentTextLabel.font.withSize(textSize)
    }
}
