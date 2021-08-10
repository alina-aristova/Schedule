//
//  scheduleVC.swift
//  tableView
//
//  Created by Алина Аристова on 09.08.2021.
//

import UIKit
import FSCalendar

class ScheduleVC: UIViewController {
    
    var calendarHeightConstraint: NSLayoutConstraint!
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.09520614892, green: 0.3064492941, blue: 0.875541687, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14 )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = #colorLiteral(red: 0.5514996648, green: 0.8220300078, blue: 0.9896561503, alpha: 0.5)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.9396380782, green: 0.8345035315, blue: 0.8808922172, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8418386579, green: 0.920121491, blue: 1, alpha: 1)
        title = "Schedule"
        setConstraints()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside )
        swipeAction()
        // Do any additional setup after loading the view.
    }
    
    @objc func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close", for: .normal)
            showHideButton.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open", for: .normal)
            showHideButton.layer.backgroundColor = #colorLiteral(red: 0.8398336768, green: 0.920227468, blue: 1, alpha: 1)

        }
    }
    func swipeAction() {
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUP.direction = .up
        calendar.addGestureRecognizer(swipeUP)
        
        let swipeDowd = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDowd.direction = .down
        calendar.addGestureRecognizer(swipeDowd)
    }

    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
    
        switch gesture.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default:
            break
        }
    }
}



//MARK: FSCalendarDataSource, FSCalendarDelegate

extension ScheduleVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
         
    }
}

extension ScheduleVC {
    
    //сверху, слева, снизу, высота
    func setConstraints() {
        view.addSubview(calendar)
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute , multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        NSLayoutConstraint.activate([calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)])
        
        view.addSubview(showHideButton)
        NSLayoutConstraint.activate([showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor , constant: 0),showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),showHideButton.widthAnchor.constraint(equalToConstant: 100), showHideButton.heightAnchor.constraint(equalToConstant: 20)])
    }
}
