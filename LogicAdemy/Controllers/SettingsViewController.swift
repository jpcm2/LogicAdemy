//
//  ListViewController.swift
//  LogicAdemy
//
//  Created by jpcm2 on 10/05/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var daysOfStudyImage: UIImageView!
    @IBOutlet var daysOfStudyView: UIView!
    @IBOutlet var daysOfStudy: UILabel!
    @IBOutlet var studyPercentageView: UIView!
    @IBOutlet var studyPercentage: UILabel!
    @IBOutlet var studyPercentageImage: UIImageView!
    @IBOutlet var topBarView: UIView!
    
    @IBOutlet var changeFontSizeTitle: UILabel!
    @IBOutlet var fontSize: UILabel!
    @IBOutlet var decreaseButton: UIButton!
    @IBOutlet var increaseButton: UIButton!
    @IBOutlet var changeFontSizeView: UIView!
    
    @IBOutlet var darkModeLabel: UILabel!
    @IBOutlet var darkModeToggle: UISwitch!
    @IBOutlet var darkModeView: UIView!

    override func viewDidAppear(_ animated: Bool) {
        setBg()
        setChangeFontSizeLabels()
        setDarkMode()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeToggle.isOn = UserDefaults.standard.bool(forKey: "darkModeState")
        setTopBar()
    }
    
    func setBg(){
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            topBarView.backgroundColor = darkBg
            self.view.backgroundColor = darkBg
        }else{
            topBarView.backgroundColor = normalBg
            self.view.backgroundColor = normalBg
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var checkSetBefore: Bool = UserDefaults.standard.bool(forKey: "setBefore")
        if(checkSetBefore == false){
            checkSetBefore = true
            UserDefaults.standard.set(checkSetBefore, forKey: "setBefore")
        }
        let newFontSize: Int = Int(fontSize.text!) ?? 24
        titleSize = CGFloat(newFontSize)
        print(titleSize)
        UserDefaults.standard.set(newFontSize, forKey: "fontSize")
        UserDefaults.standard.set(darkModeToggle.isOn, forKey: "darkModeState")
    }
    
    func setDarkMode(){
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeToggle.translatesAutoresizingMaskIntoConstraints = false
        darkModeView.translatesAutoresizingMaskIntoConstraints = false
        
        darkModeView.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.75).isActive = true
        darkModeView.topAnchor.constraint(equalTo: changeFontSizeView.bottomAnchor, constant: 32).isActive = true
        darkModeView.heightAnchor.constraint(equalToConstant: self.view.frame.width*0.5).isActive = true
        darkModeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        darkModeView.layer.borderWidth = 1.0
        darkModeView.layer.borderColor = primaryColorCG
        darkModeView.layer.cornerRadius = 12
        darkModeView.layer.shadowColor = UIColor.gray.cgColor
        darkModeView.layer.shadowOpacity = 0.4
        darkModeView.layer.shadowRadius = 12
        darkModeView.layer.shadowOffset = CGSize(width: 0, height: 12)
        darkModeView.backgroundColor = secondaryColor
        
        darkModeLabel.numberOfLines = 2
        darkModeLabel.font = darkModeLabel.font.withSize(1.25*titleSize)
        darkModeLabel.textAlignment = .center
        darkModeLabel.text = "Modo Noturno"
        darkModeLabel.centerXAnchor.constraint(equalTo: darkModeView.centerXAnchor).isActive = true
        darkModeLabel.textColor = primaryColor
        darkModeLabel.bottomAnchor.constraint(equalTo: darkModeView.centerYAnchor, constant: -10).isActive = true
        
        darkModeToggle.centerXAnchor.constraint(equalTo: darkModeView.centerXAnchor).isActive = true
        darkModeToggle.topAnchor.constraint(equalTo: darkModeLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func setChangeFontSizeLabels(){
        changeFontSizeTitle.translatesAutoresizingMaskIntoConstraints = false
        fontSize.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false
        changeFontSizeView.translatesAutoresizingMaskIntoConstraints = false
        
        
        changeFontSizeView.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.75).isActive = true
        changeFontSizeView.topAnchor.constraint(equalTo: topBarView.bottomAnchor, constant: 32).isActive = true
        changeFontSizeView.heightAnchor.constraint(equalToConstant: self.view.frame.width*0.5).isActive = true
        changeFontSizeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        changeFontSizeView.layer.borderWidth = 1.0
        changeFontSizeView.layer.borderColor = primaryColorCG
        changeFontSizeView.layer.cornerRadius = 12
        changeFontSizeView.layer.shadowColor = UIColor.gray.cgColor
        changeFontSizeView.layer.shadowOpacity = 0.4
        changeFontSizeView.layer.shadowRadius = 12
        changeFontSizeView.layer.shadowOffset = CGSize(width: 0, height: 12)
        changeFontSizeView.backgroundColor = secondaryColor
        
        
        changeFontSizeTitle.numberOfLines = 3
        changeFontSizeTitle.font = changeFontSizeTitle.font.withSize(1.25*titleSize)
        changeFontSizeTitle.textAlignment = .center
        changeFontSizeTitle.text = "Tamanho da fonte"
        changeFontSizeTitle.centerXAnchor.constraint(equalTo: changeFontSizeView.centerXAnchor).isActive = true
        changeFontSizeTitle.bottomAnchor.constraint(equalTo: changeFontSizeView.centerYAnchor, constant: -10).isActive = true
        changeFontSizeTitle.textColor = primaryColor
        
        
        fontSize.font = fontSize.font.withSize(titleSize)
        fontSize.textAlignment = .center
        fontSize.centerXAnchor.constraint(equalTo: changeFontSizeView.centerXAnchor).isActive = true
        fontSize.topAnchor.constraint(equalTo: changeFontSizeTitle.bottomAnchor, constant: 20).isActive = true
        fontSize.text = "\(Int(titleSize))"
        fontSize.textColor = primaryColor
        
        decreaseButton.centerYAnchor.constraint(equalTo: fontSize.centerYAnchor).isActive = true
        decreaseButton.rightAnchor.constraint(equalTo: fontSize.leftAnchor, constant: -24).isActive = true
        decreaseButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        decreaseButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        increaseButton.centerYAnchor.constraint(equalTo: fontSize.centerYAnchor).isActive = true
        increaseButton.leftAnchor.constraint(equalTo: fontSize.rightAnchor, constant: 24).isActive = true
        increaseButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        increaseButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    func setTopBar(){
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topBarView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        topBarView.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.9).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: topBarView!, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 50))
        topBarView.heightAnchor.constraint(equalToConstant: studyPercentageView.frame.height + studyPercentageImage.frame.height + 24).isActive = true
        topBarView.layer.shadowColor = UIColor.gray.cgColor
        topBarView.layer.shadowOpacity = 0.4
        topBarView.layer.shadowOffset = .zero
        topBarView.layer.shadowRadius = 8
        topBarView.layer.shadowOffset = CGSize(width: 0, height: 8)
        topBarView.layer.cornerRadius = 8
        setTopBarViews()
        daysOfStudyImage.image = UIImage(imageLiteralResourceName: "Flame")
        studyPercentageImage.image = UIImage(imageLiteralResourceName: "Porcentagem")
        daysOfStudy.text = "\(numberOfDays) dias"
        setTopBarLabels(label: daysOfStudy, view: daysOfStudyView, icon: daysOfStudyImage)
        setTopBarLabels(label: studyPercentage, view: studyPercentageView, icon: studyPercentageImage)
    }
    
    func setTopBarViews(){
        daysOfStudyView.translatesAutoresizingMaskIntoConstraints = false
        studyPercentageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: daysOfStudyView!, attribute: .top, relatedBy: .equal, toItem: topBarView!, attribute: .top, multiplier: 1, constant: 12))
        self.view.addConstraint(NSLayoutConstraint(item: daysOfStudyView!, attribute: .left, relatedBy: .equal, toItem: topBarView!, attribute: .left, multiplier: 1, constant: 12))
        self.view.addConstraint(NSLayoutConstraint(item: daysOfStudyView!, attribute: .bottom, relatedBy: .equal, toItem: topBarView!, attribute: .bottom, multiplier: 1, constant: -12 - daysOfStudyImage.frame.height))
        daysOfStudyView.widthAnchor.constraint(equalToConstant: topBarView.frame.width*0.25).isActive = true
        
        self.view.addConstraint(NSLayoutConstraint(item: studyPercentageView!, attribute: .top, relatedBy: .equal, toItem: topBarView!, attribute: .top, multiplier: 1, constant: 12))
        self.view.addConstraint(NSLayoutConstraint(item: studyPercentageView!, attribute: .right, relatedBy: .equal, toItem: topBarView!, attribute: .right, multiplier: 1, constant: -12))
        self.view.addConstraint(NSLayoutConstraint(item: studyPercentageView!, attribute: .bottom, relatedBy: .equal, toItem: topBarView!, attribute: .bottom, multiplier: 1, constant: -12 - studyPercentageImage.frame.height))
        studyPercentageView.widthAnchor.constraint(equalToConstant: topBarView.frame.width*0.25).isActive = true
    }
    
    func setTopBarLabels(label: UILabel, view: UIView, icon: UIImageView){
        label.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = white
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 4
        view.backgroundColor = darkBlue
        view.layer.borderColor = whiteCG
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    @IBAction func changeFontSize(_ sender: UIButton) {
        var actualFontSize: Int = Int(fontSize.text!) ?? 0
        if(sender.tag ==  1){
            if(actualFontSize <= 15){
                return
            }
            actualFontSize = actualFontSize - 1
        }else if(sender.tag == 2){
            if(actualFontSize >= 30){
                return
            }
            actualFontSize = actualFontSize + 1
        }
        fontSize.text = "\(actualFontSize)"
    }
    
}
