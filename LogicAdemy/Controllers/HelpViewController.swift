//
//  HelpViewController.swift
//  LogicAdemy
//
//  Created by jpcm2 on 10/05/22.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet var daysOfStudyView: UIView!
    @IBOutlet var daysOfStudy: UILabel!
    @IBOutlet var studyPercentage: UILabel!
    @IBOutlet var daysOfStudyImage: UIImageView!
    @IBOutlet var studyPercentageView: UIView!
    @IBOutlet var studyPercentageImage: UIImageView!
    @IBOutlet var topBarView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        setBg()
        collectionView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setTopBar()
    }

    func setBg(){
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            topBarView.backgroundColor = darkBg
            collectionView.backgroundColor = darkBg
            self.view.backgroundColor = darkBg
        }else{
            topBarView.backgroundColor = normalBg
            self.view.backgroundColor = normalBg
            collectionView.backgroundColor = normalBg
        }
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
}

extension HelpViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        settingsCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "helpPageCardCell", for: indexPath) as! HelpPageCollectionViewCell
        let card = settingsCards[indexPath.row]
        
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            cell.helpPageCardView.backgroundColor = darkBlue
            cell.helpPageCardTitle.textColor = white
            cell.helpPageCardDescription.textColor = white
        }else{
            cell.helpPageCardView.backgroundColor = white
            cell.helpPageCardTitle.textColor = darkBlue
            cell.helpPageCardDescription.textColor = darkBlue
        }
        
        cell.helpPageCardView.layer.cornerRadius = 12
        cell.helpPageCardView.layer.shadowColor = UIColor.gray.cgColor
        cell.helpPageCardView.layer.shadowOpacity = 0.4
        cell.helpPageCardView.layer.shadowOffset = .zero
        cell.helpPageCardView.layer.shadowRadius = 8
        cell.helpPageCardView.layer.shadowOffset = CGSize(width: 0, height: 6)
        cell.helpPageCardView.layer.borderWidth = 0.8
        cell.helpPageCardView.layer.borderColor = primaryColorCG
        
        cell.helpPageCardTitle.translatesAutoresizingMaskIntoConstraints = false
        cell.helpPageCardTitle.text = card.title
        cell.helpPageCardTitle.widthAnchor.constraint(equalToConstant: cell.helpPageCardView.frame.width*0.9).isActive = true
        cell.helpPageCardTitle.centerXAnchor.constraint(equalTo: cell.helpPageCardView.centerXAnchor).isActive = true
        cell.helpPageCardTitle.bottomAnchor.constraint(equalTo: cell.helpPageCardView.centerYAnchor,constant: -36).isActive = true
        cell.helpPageCardTitle.textAlignment = .center
        cell.helpPageCardTitle.numberOfLines = 3
        cell.helpPageCardTitle.font = cell.helpPageCardTitle.font.withSize(titleSize)
        
        cell.helpPageCardDescription.translatesAutoresizingMaskIntoConstraints = false
        cell.helpPageCardDescription.text = card.description
        cell.helpPageCardDescription.widthAnchor.constraint(equalToConstant: cell.helpPageCardView.frame.width*0.8).isActive = true
        cell.helpPageCardDescription.centerXAnchor.constraint(equalTo: cell.helpPageCardView.centerXAnchor).isActive = true
        cell.helpPageCardDescription.topAnchor.constraint(equalTo: cell.helpPageCardTitle.bottomAnchor,constant: 24).isActive = true
        cell.helpPageCardDescription.textAlignment = .justified
        cell.helpPageCardDescription.numberOfLines = 5
        cell.helpPageCardDescription.font = cell.helpPageCardTitle.font.withSize(textSize)
        
        
        return cell
    }
}
