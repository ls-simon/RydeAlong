//
//  Cell.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 16.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit

@objc protocol PlayerCellDelegate {
    func removeCellFromList()
}


// MARK: - Data structure -
struct PlayerData {
    let id: String!
    let image: UIImage?
    let imageId: String
    let firstName: String
    let lastName: String
    let displayName: String
    let clubName: String
    let reportIds: [String]
}


class PlayerCell: UICollectionViewCell {

    // MARK: - vars -
    private struct animationSpeed {
        static let fast = 0.2
        static let slow = 0.4
    }
    private var contentFrame: CGRect?
    var delegate: PlayerCellDelegate?


    // MARK: - Outlets  -
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var cellContent: UIView!
    @IBOutlet weak var placeholderImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var reportCount: UILabel!
    @IBOutlet weak var chevron: UIImageView!


    // MARK: - overrides -
    override func awakeFromNib() {
        super.awakeFromNib()
        playerImage.layer.cornerRadius = playerImage.frame.height / 2
        playerImage.layer.masksToBounds = true
        deleteButton.alpha = 0
    }


    // MARK: - setup  -
    func setData(player: PlayerData) {
        if let image = player.image {
            playerImage.image = image
            playerImage.alpha = 1.0
            placeholderImage.isHidden = true
        } else {
            placeholderImage.isHidden = false
            playerImage.image = nil
            playerImage.alpha = 0.0
        }
        playerName.text = player.displayName
        clubName.text = player.clubName
        reportCount.text = String(player.reportIds.count)
    }

    func updatePlayerImage(image: UIImage) {
        DispatchQueue.main.async {
            self.playerImage.image = image
            UIView.animate(withDuration: 0.4, animations: {
                self.playerImage.alpha = 1.0
            }) { (didFinish) in
                self.placeholderImage.isHidden = didFinish
            }
        }
    }

    // MARK: - delete cell -
    func provideDeletion() {
        let deleteButtonSize = deleteButton.frame.size
        let deleteButtonOrigin = deleteButton.frame.origin
        deleteButton.tintColor = UIColor.red
        deleteButton.frame = CGRect(origin: deleteButton.center, size: CGSize.zero)
        contentFrame = cellContent.frame
        UIView.animate(withDuration: animationSpeed.fast, animations: {
            let contentOrigin = self.contentFrame!.origin
            let origin = CGPoint(x: contentOrigin.x + 4, y: contentOrigin.y)
            self.cellContent.frame = CGRect(origin: origin, size: CGSize(width: self.contentFrame!.width - 8, height: self.contentFrame!.height))
            self.deleteButton.alpha = 1.0
            self.cellContent.layer.cornerRadius = 6
        })
        UIView.animate(withDuration: animationSpeed.slow, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.deleteButton.frame = CGRect(origin: deleteButtonOrigin, size: deleteButtonSize)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.cellContent.transform = CGAffineTransform(rotationAngle: 0.01)
            })
        }
    }

    @IBAction func removeCellFromList(_ sender: UIButton) {
        delegate?.removeCellFromList()
    }

    func unsetDeletion() {
        cellContent.layer.removeAllAnimations()
        UIView.animate(withDuration: animationSpeed.fast) {
            self.deleteButton.alpha = 0
            self.cellContent.frame = self.contentFrame ?? self.cellContent.frame
            self.cellContent.layer.cornerRadius = 0
            self.cellContent.transform = CGAffineTransform.identity
        }
    }

    func doesProvideDeletion() -> Bool {
        return deleteButton.alpha > 0
    }
}
