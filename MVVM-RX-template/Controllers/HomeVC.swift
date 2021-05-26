//
//  PhotosVC.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/10/20
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher
class HomeVC: MasterVC {
    
    // MARK: - VARS
    private var photosVM = PhotosVM()

    private var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    )
    
    private var inset : CGFloat = 5
    private var cellSize : CGSize {
        let width = (self.view.bounds.width / 3) - (inset * 2)
        return CGSize(width: width, height: width)
    }
    
    
    // MARK: - LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindAndSetupCollection()
        bindUI()
        
        // MARK: - API CALL ( get posts )
        photosVM.loadData()
    }
    
    // MARK: - PRIVATE
    override func setupViews() {
        super.setupViews()
        
        // NAV
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Picsum 🏞"
        navigationItem.backButtonTitle = " "
        
        // COLLECTION
        view.addSubview(collectionView)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: inset * 2, left: inset * 2, bottom: inset * 2, right: inset * 2)
        layout.minimumLineSpacing = inset
        layout.minimumInteritemSpacing = inset
        layout.itemSize = cellSize
        collectionView.collectionViewLayout = layout
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    private func bindUI() {
        photosVM
            .loading
            .asDriver(onErrorJustReturn: false)
            .drive(self.rx.hudIsAnimating)
            .disposed(by: bag)
        
        photosVM
            .hideCollection
            .drive(self.collectionView.rx.isHidden)
            .disposed(by: bag)
        
        photosVM
            .error
            .bind(to: self.rx.showErrorAlert)
            .disposed(by: bag)
    
    }

}


// MARK: - COLLECTION
extension HomeVC  {

    private func bindAndSetupCollection () {
        collectionView.registerCellClass(PhotoCell.self)
        collectionView.hideScrollIndicators()
        collectionView.backgroundColor = .systemBackground
        

        
        
        photosVM.photosList
            .drive( collectionView.rx.items(cellIdentifier: String(describing: PhotoCell.self), cellType: PhotoCell.self)) { indexPath, row, cell in
                cell.config(vmItem: row)
            }
            .disposed(by: bag)
        
        
        collectionView.rx.itemSelected.subscribe (onNext: { idxPath in
            let selectedItem = self.photosVM.photoM[idxPath.row]
            let detailsVC = DetailsVC(mItem: selectedItem)
            self.present(detailsVC, animated: true, completion: nil)
        })
        .disposed(by: bag)

    }

}


// MARK: - CELL
class PhotoCell : UICollectionViewCell {

    
    // MARK: - VIEWS
    let imageView : UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.backgroundColor = .secondarySystemBackground
        v.layer.cornerRadius = 5
        return v
    }()

    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        KingfisherManager.shared.downloader.downloadTimeout = 100
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - PUBLIC
    public func config(vmItem : PhotoCellVM ) {

        self.imageView.kf.setImage(
            with: vmItem.url,
            placeholder: nil,
            options: [.transition(.fade(0.4)), .processor(KFProcessor.smallImageProcessor)],
            progressBlock: nil, completionHandler: nil
        )
    }

}



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeVCPreview: PreviewProvider {
    static var previews: some View {
        HomeVC().toPreview()
    }
}
#endif
