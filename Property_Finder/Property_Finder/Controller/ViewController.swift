//
//  ViewController.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //IBOutlets
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    //Data holders
    var activityIndicator: UIActivityIndicatorView?
    var refreshControl = UIRefreshControl()
    var baseModel: BaseModel?
    var page = 0
    var order = "pa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NavigationBarSetup
        navigationBarSetup()
        
        //Delegates
        performDelegates()
        
        //Getting data from server
        getData(order: self.order, page: self.page)
    }
    
    
    
    //SegmentedController action listener
    @IBAction func indexDidChanged(_ sender: UISegmentedControl) {
        switch segmentedController.selectedSegmentIndex {
        case 0:
            setupData(order: "pa")
        case 1:
            setupData(order: "pd")
        case 2:
            setupData(order: "ba")
        case 3:
            setupData(order: "bd")
        default:
            return
        }
    }
    
    //Setup the data
    func setupData(order: String) {
        self.baseModel = nil
        self.collectionView.reloadData()
        self.order = order
        self.page = 0
        self.getData(order: self.order, page: self.page)
    }
}

extension ViewController {
    
    //NavigationBarSetup
    func navigationBarSetup() {
        self.title = "Property Finder"
    }
    
    //Delegates
    func performDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    //Refresh Controller method
    @objc func refresh(sender:AnyObject) {
        self.page = 0
        getData(order: self.order, page: self.page)
    }
    
    //Getting data from server
    func getData(order: String, page: Int) {
        self.activityIndicator = self.showActivityIndicator(view: self.view)
        
        if page == 0 {
            APIService.instance.getData(order: order, page: page, dataHandler: { (baseModel) in
                self.baseModel = baseModel
                self.collectionView.reloadData()
            }) { (success) in
                if success {
                    self.refreshControl.endRefreshing()
                    if let activity = self.activityIndicator {
                        self.page = 1
                        activity.stopAnimating()
                    }
                } else {
                    self.refreshControl.endRefreshing()
                    if let activity = self.activityIndicator {
                        activity.stopAnimating()
                    }
                    self.displayAlert(title: "Property Finder", message: "Oopss. Something went wrong")
                }
            }
        } else {
            APIService.instance.getData(order: order, page: page, dataHandler: { (baseModel) in
                if let payLoad = baseModel.res {
                    for i in payLoad {
                        self.baseModel?.res?.append(i)
                    }
                }
                self.collectionView.reloadData()
            }) { (success) in
                if success {
                    self.refreshControl.endRefreshing()
                    if let activity = self.activityIndicator {
                        self.page += 1
                        activity.stopAnimating()
                    }
                } else {
                    self.refreshControl.endRefreshing()
                    if let activity = self.activityIndicator {
                        activity.stopAnimating()
                    }
                    self.displayAlert(title: "Property Finder", message: "Oopss. Something went wrong")
                }
            }
        }
    }
}

extension ViewController {
    
    //CollectionView Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let baseModel = self.baseModel {
            if let payLoad = baseModel.res {
                noDataLabel.isHidden = true
                return payLoad.count
            } else {
                noDataLabel.isHidden = false
                return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CustomCollectionViewCell {
            
            if let baseModel = self.baseModel {
                if let payLoad = baseModel.res {
                    if let imageURL = payLoad[indexPath.row].thumbnail {
                        cell.thumbnailImage.loadImage(urlString: imageURL)
                    } else {
                        cell.thumbnailImage.image = UIImage(named: "launch_screen_img")
                    }
                    if let price = payLoad[indexPath.row].price {
                        if let currency = payLoad[indexPath.row].currency {
                            cell.price.text = "\(price) \(currency)"
                        } else {
                            cell.price.text = "\(price) $"
                        }
                    } else {
                        cell.price.text = "0 $"
                    }
                    if let title = payLoad[indexPath.row].title {
                        cell.title.text = title
                    } else {
                        cell.title.text = ""
                    }
                }
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 430)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let baseModel = self.baseModel {
            if let payLoad = baseModel.res {
                if indexPath.row == payLoad.count - 1 {
                    self.getData(order: self.order, page: self.page)
                }
            }
        }
    }
}
