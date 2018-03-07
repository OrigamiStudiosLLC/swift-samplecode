//
//  OnboardingVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 29/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit
import SDWebImage
typealias DoneHandler = (_ index:Int) -> Void
class OnboardingVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var pcOnboarding: UIPageControl!
    // instences
    var imagesArray: Array<UIImage> = []
    var titlesArray: Array<String> = []
    var descriptionsArray: Array<String> = []
    var titleLabelColor = UIColor.darkGray
    var descriptionLabelColor = UIColor.lightGray
    var doneTapped: DoneHandler?
    
    
    
    @objc class func getInOnboarding(imagesArray: Array<UIImage>, titlesArray: Array<String>, descrtionsArray: Array<String>) -> OnboardingVC{
        let me: OnboardingVC = OnboardingVC.init(nibName: "OnboardingVC", bundle: nil)
        me.imagesArray = imagesArray
        me.titlesArray = titlesArray
        me.descriptionsArray = descrtionsArray
        return me
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.onboardingCollectionView.register(UINib.init(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCellID")
        self.pcOnboarding.numberOfPages = self.imagesArray.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - CollectionViewDelegate
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return self.imagesArray.count
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if self.imagesArray.count>0 {
            return 1
        }
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCellID", for: indexPath) as! OnboardingCell
        cell.imgView.image = self.imagesArray[indexPath.section]
        cell.lblTitle.textColor = titleLabelColor
        cell.lblDescripton.textColor = descriptionLabelColor
        if indexPath.section<self.titlesArray.count {
            cell.lblTitle.text = self.titlesArray[indexPath.section]
        }
        if indexPath.section<self.descriptionsArray.count {
            cell.lblDescripton.text = self.descriptionsArray[indexPath.section]
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 480);
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 0, 0, 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        // this method will be called whenever you tap on an Onboarding card space other than buttons area
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pcOnboarding.currentPage = currentIndex
        if currentIndex == self.imagesArray.count-1 {
            self.btnDone.setTitle("Done", for: UIControlState.normal)
        }else{
            self.btnDone.setTitle("Skip", for: UIControlState.normal)
        }
    }
//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if ([scrollView isKindOfClass:[UICollectionView class]]) {
//    self.pageControleTeamInfo.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
//    }
//
//    }
    @IBAction func onTapDone(_ sender: Any) {
        self.doneTapped!(self.pcOnboarding.currentPage)
    }
}

