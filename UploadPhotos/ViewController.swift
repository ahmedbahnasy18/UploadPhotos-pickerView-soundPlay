//
//  ViewController.swift
//  UploadPhotos
//
//  Created by ahmed on 6/27/17.
//  Copyright © 2017 MyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let cellIdentifier = "PhotosCell"
    @IBOutlet var collectionView: UICollectionView!
    lazy var addButton : UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        return button
    }()
    
    var images = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = Array(repeating: #imageLiteral(resourceName: "placeholder2.png"), count: 5)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        // to enable scrolling even if there is only one item in the view
        collectionView.alwaysBounceVertical = true
        
        navigationItem.rightBarButtonItem = addButton
    }
    var pickedImage : UIImage? {
        didSet {
            guard let image = pickedImage else { return }
            self.images.append(image)
            self.collectionView.reloadData()
        }
    }
    
    @objc private func handleAdd() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        self.present(picker, animated: true, completion: nil)
    }
    
}
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.pickedImage = editedImage
        }else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.pickedImage = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotosCell else { return UICollectionViewCell() }
            cell.iv.image = self.images[indexPath.row]
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        var width = (screenWidth - 30)/2
        
        width = width > 200 ? 200 : width
        return CGSize.init(width: width, height: width)
    }
}
















