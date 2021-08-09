//
//  scheduleVC.swift
//  tableView
//
//  Created by Алина Аристова on 09.08.2021.
//

import UIKit
import FSCalendar
class ScheduleVC: UIViewController {
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8418386579, green: 0.920121491, blue: 1, alpha: 1)
        title = "Schedule"
        setConstraints()
        // Do any additional setup after loading the view.
    }
    

}
extension ScheduleVC {
    
    func setConstraints() {
        view.addSubview(calendar)
        NSLayoutConstraint.activate([calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), calendar.heightAnchor.constraint(equalToConstant: 300)])
    }
}
