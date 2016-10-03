//
//  EventsHeaderView.swift
//  UCLA Radio
//
//  Created by Christopher Laganiere on 10/2/16.
//  Copyright © 2016 ChrisLaganiere. All rights reserved.
//

import UIKit

class EventsHeaderView: UITableViewHeaderFooterView {

    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clear
        
        label.font = UIFont.boldSystemFont(ofSize: 30)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(preferredContraints())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style(month: String) {
        label.text = month.lowercased()
    }
    
    // MARK: - Layout
    
    static func preferredHeight() -> CGFloat {
        return 50.0
    }
    
    private func preferredContraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[label]|", options: [], metrics: nil, views: ["label": label])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-(40)-[label]|", options: [], metrics: nil, views: ["label": label])
        
        return constraints
    }

}
