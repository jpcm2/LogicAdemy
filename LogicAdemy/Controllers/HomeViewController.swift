//
//  ViewController.swift
//  LogicAdemy
//
//  Created by jpcm2 on 10/05/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var daysOfStudy: UILabel!
    @IBOutlet var daysOfStudyView: UIView!
    @IBOutlet var studyPercentageView: UIView!
    @IBOutlet var studyPercentage: UILabel!
    @IBOutlet var daysOfStudyImage: UIImageView!
    @IBOutlet var studyPercentageImage: UIImageView!
    @IBOutlet var topBarView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidAppear(_ animated: Bool) {
        setSettings()
        setBg()
        setTabBar()
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setDaysOfStudy()
        setTopBar()
    }
    
    func setBg(){
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            topBarView.backgroundColor = darkBg
            self.view.backgroundColor = darkBg
            collectionView.backgroundColor = darkBg
        }else{
            topBarView.backgroundColor = normalBg
            self.view.backgroundColor = normalBg
            collectionView.backgroundColor = normalBg
        }
    }
    
    func setDaysOfStudy() {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        if(!UserDefaults.standard.bool(forKey: "setBeforeNumberOfDays")){
            UserDefaults.standard.set(true, forKey: "setBeforeNumberOfDays")
            numberOfDays = 1
        }else {
            numberOfDays = UserDefaults.standard.integer(forKey: "daysOfStudy")
            let savedDay = UserDefaults.standard.integer(forKey: "currentDay")
            let savedMonth = UserDefaults.standard.integer(forKey: "currentMonth")
            if(savedMonth != month) {
                print()
                numberOfDays = 1
            }else if(day - savedDay > 1){
                numberOfDays = 1
            }else if (day - savedDay == 1){
                print("Aumentar dia")
                print(day)
                print(savedDay)
                numberOfDays = numberOfDays + 1
            }
        }
        print(day)
        UserDefaults.standard.set(numberOfDays, forKey: "daysOfStudy")
        UserDefaults.standard.set(day, forKey: "currentDay")
        UserDefaults.standard.set(month, forKey: "currentMonth")
    }
    
    func setSettings() {
        if(UserDefaults.standard.bool(forKey: "setBefore")){
            titleSize = CGFloat(UserDefaults.standard.integer(forKey: "fontSize"))
            textSize = titleSize - 8.0
            if(UserDefaults.standard.bool(forKey: "darkModeState")){
                primaryColor = white
                secondaryColor = darkBlue
            }else{
                primaryColor = darkBlue
                secondaryColor = white
            }
        }
        print(titleSize)
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
        daysOfStudy.text = "\(numberOfDays) dias"
        studyPercentageImage.image = UIImage(imageLiteralResourceName: "Porcentagem")
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
    
    func setTabBar(){
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 8),
            colors: [
                UIColor.clear.cgColor,
                UIColor.black.withAlphaComponent(0.1).cgColor
            ]
        )

        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6
                
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image

        UITabBar.appearance().standardAppearance = appearance
        
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            self.tabBarController?.tabBar.unselectedItemTintColor = white
        }else{
            self.tabBarController?.tabBar.unselectedItemTintColor = .gray
        }
        
        if let tabBar = self.tabBarController?.tabBar {
            tabBar.tintColor = red
            tabBar.layer.cornerRadius = 12
        }
        if let tabBarItem1 = self.tabBarController?.tabBar.items?[0] {
            tabBarItem1.title = ""
            tabBarItem1.image = UIImage(imageLiteralResourceName: "HomeIcon")
        }
        if let tabBarItem2 = self.tabBarController?.tabBar.items?[1] {
            tabBarItem2.title = ""
            tabBarItem2.image = UIImage(imageLiteralResourceName: "Settings")
        }
        if let tabBarItem3 = self.tabBarController?.tabBar.items?[2] {
            tabBarItem3.title = ""
            tabBarItem3.image = UIImage(imageLiteralResourceName: "QuestionMark")
        }
    }
}

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(cards[indexPath.row].title)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "contentSegue"){
            guard let indexPath = collectionView.indexPathsForSelectedItems else {return}
            let ContentViewController = segue.destination as! ContentViewController
            print(cards[indexPath[0].row].title)
            print("teste")
            ContentViewController.mainTitle = cards[indexPath[0].row].title
            ContentViewController.contentText = "Lorem ipsum dolor sit amet. Est dicta quasi est incidunt pariatur et saepe impedit? Vel maxime ipsum distinctio voluptatem id quasi quibusdam. Sit ipsa quisquam qui tempora adipisci ea distinctio libero et deserunt necessitatibus sed laborum aspernatur id doloremque aliquam qui accusamus aliquam? Ut quisquam dolor aut dolorum nihil quo quae repudiandae est dolor galisum sit esse reprehenderit aut suscipit molestiae. Aut rerum dignissimos in numquam odit ut maxime culpa ut eveniet doloribus."
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homePageCardCell", for: indexPath) as! HomePageCollectionViewCell
        let card = cards[indexPath.row]
        
        if(UserDefaults.standard.bool(forKey: "darkModeState")){
            cell.homePageCardView.backgroundColor = darkBlue
            cell.homePageCardTitle.textColor = white
            cell.homePageCardDescription.textColor = white
        }else{
            cell.homePageCardView.backgroundColor = white
            cell.homePageCardDescription.textColor = darkBlue
            cell.homePageCardTitle.textColor = darkBlue
        }
        
        cell.homePageCardView.layer.cornerRadius = 12
        cell.homePageCardView.layer.shadowColor = UIColor.gray.cgColor
        cell.homePageCardView.layer.shadowOpacity = 0.4
        cell.homePageCardView.layer.shadowOffset = .zero
        cell.homePageCardView.layer.shadowRadius = 8
        cell.homePageCardView.layer.shadowOffset = CGSize(width: 0, height: 6)
        cell.homePageCardView.layer.borderWidth = 0.8
        cell.homePageCardView.layer.borderColor = primaryColorCG
        
        print(card.bgColor)
        cell.homePageCardTitle.translatesAutoresizingMaskIntoConstraints = false
        cell.homePageCardTitle.text = card.title
        cell.homePageCardTitle.widthAnchor.constraint(equalToConstant: cell.homePageCardView.frame.width).isActive = true
        cell.homePageCardTitle.centerYAnchor.constraint(equalTo: cell.homePageCardView.centerYAnchor, constant: -36).isActive = true
        cell.homePageCardTitle.centerXAnchor.constraint(equalTo: cell.homePageCardView.centerXAnchor).isActive = true
        cell.homePageCardTitle.textAlignment = .center
        cell.homePageCardTitle.font = cell.homePageCardTitle.font.withSize(titleSize)
        
        
        cell.homePageCardDescription.translatesAutoresizingMaskIntoConstraints = false
        cell.homePageCardDescription.text = card.description
        cell.homePageCardDescription.widthAnchor.constraint(equalToConstant: 0.8*cell.homePageCardView.frame.width).isActive = true
        cell.homePageCardDescription.topAnchor.constraint(equalTo: cell.homePageCardTitle.bottomAnchor, constant: 24).isActive = true
        cell.homePageCardDescription.centerXAnchor.constraint(equalTo: cell.homePageCardView.centerXAnchor).isActive = true
        cell.homePageCardDescription.textAlignment = .justified
        cell.homePageCardDescription.numberOfLines = 5
        cell.homePageCardDescription.font = cell.homePageCardTitle.font.withSize(textSize)
        
        return cell
    }
}
