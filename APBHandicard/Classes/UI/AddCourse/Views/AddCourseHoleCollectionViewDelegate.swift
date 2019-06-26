//
//  AddCourseHoleCollectionViewDelegate.swift
//  APBHandicard
//
//  Created by ApprovedBug on 20/06/2019.
//  Copyright © 2019 ApprovedBug. All rights reserved.
//

import UIKit

class AddCourseHoleCollectionViewDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    weak var delegate: AddCourseFooterViewDelegate?
    var holes: [HoleDTO]?
    let cellReuseIdentifier = "holeCellId"
    let footerReuseIdentifier = "footerId"

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return holes?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! AddCourseHoleCollectionViewCell

        if let hole = holes?[indexPath.item] {
            cell.hole = hole
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerReuseIdentifier, for: indexPath) as! AddCourseFooterView

        view.delegate = delegate

        return view
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 56)
    }
}

