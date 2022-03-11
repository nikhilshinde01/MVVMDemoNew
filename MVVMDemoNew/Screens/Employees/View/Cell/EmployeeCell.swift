//
//  EmployeeCell.swift
//  MVVMDemoNew
//
//  Created by Nikhil Shinde on 11/03/22.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var salaryLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!

    @IBOutlet weak var MainBorderView: UIView!
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }

    var cellViewModel: EmployeeCellViewModel? {
        didSet {
            idLabel.text = cellViewModel?.id
            nameLabel.text = cellViewModel?.name
            salaryLabel.text = cellViewModel?.salary
            ageLabel.text = cellViewModel?.age
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }

    func initView() {
        // Cell view customization
 applyShadowOnView(MainBorderView)
        backgroundColor = .clear
        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        idLabel.text = nil
        nameLabel.text = nil
        salaryLabel.text = nil
        ageLabel.text = nil
    }
    func applyShadowOnView(_ view: UIView) {
        MainBorderView.layer.cornerRadius = 8
        MainBorderView.layer.shadowColor = UIColor.lightGray.cgColor
        MainBorderView.layer.shadowOpacity = 1
        MainBorderView.layer.shadowOffset = .zero
        MainBorderView.layer.shadowRadius = 5
    }
}
