//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Diego Marcolino Santana on 15/01/26.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    @IBOutlet weak var contectView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let shakeyBellView = ShakeyBellView()
    
    struct ViewModel {
        var welcome: String
        var date: Date
        
        var dateFormatted: String {
               return date.monthDayYearString
           }
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: 144)
        }
        
        private func commonInit() {
           
           let bundle = Bundle(for: AccountSummaryHeaderView.self)
           bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
            
           addSubview(contectView)
           contectView.backgroundColor = appCollor
            
           contectView.translatesAutoresizingMaskIntoConstraints = false
           contectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
           contectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
           contectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
           contectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
           setupShakeyBell()
            
        }
    
        private func setupShakeyBell() {
            shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(shakeyBellView)
            
            NSLayoutConstraint.activate([
                shakeyBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
                shakeyBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    
    func configure(viewModel: ViewModel) {
        welcomeLabel.text = viewModel.welcome
        dateLabel.text = viewModel.dateFormatted
    }
}
