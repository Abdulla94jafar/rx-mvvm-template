//
//  DetailsVC.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/12/20
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import Kingfisher

class DetailsVC: MasterVC {
    
    // MARK: - VARS
    public var photoM : PhotoM!
    private let detailsVM = DetailsVM()

    // MARK: - VIEWS
    let imageView : UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.backgroundColor = .secondarySystemBackground
        v.layer.cornerRadius = 20
        return v
    }()

    let authorLabel : UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 20, weight: .bold)
        return l
    }()
    
    let dimensionsLabel : UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 17, weight: .semibold)
        l.textColor = .lightGray
        return l
    }()
    
    let titlesStack : UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .leading
        s.distribution = .fill
        s.spacing = 5
        return s
    }()
    
    
    // MARK: - INIT
    init(mItem : PhotoM) {
        self.photoM = mItem
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        detailsVM.photoM = self.photoM
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .white
        navigationItem.title = "Details"

        // LARGE IMAGE
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(view.bounds.height / 2.1)
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
        }
        
        // TITLE STACK
        titlesStack.addArrangedSubview(authorLabel)
        titlesStack.addArrangedSubview(dimensionsLabel)
        view.addSubview(titlesStack)
        titlesStack.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - PRIVATE
    func bindUI() {
        detailsVM.authorName.drive(authorLabel.rx.text).disposed(by: bag)
        detailsVM.dimension.drive(dimensionsLabel.rx.text).disposed(by: bag)
        detailsVM.photoUrl.drive(imageView.rx.kfBinder).disposed(by: bag)
    }
    
    #if DEBUG
    deinit {
        print("DEINIT DETAILS VC")
    }
    #endif

}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailsVCPreview: PreviewProvider {
    static var previews: some View {
        let postTest = PhotoM(id: "", author: "Alejandro Escamilla", width: 5000, height: 5000, unsplashUrl: "", downloadURL: "")
        DetailsVC(mItem: postTest).toPreview()
    }
}
#endif
