//
//  ViewController.swift
//  tableView
//
//  Created by Алина Аристова on 09.08.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view.
    }

    func setupTabBar() {
        
        let scheduleVC = creatNavController(vc: ScheduleVC(), itemName: "schedule", itemImage: "calendar.badge.clock")
        let tasksVC = creatNavController(vc: TasksVC(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        let contactsVC = creatNavController(vc: ContactsVC(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")
        viewControllers = [scheduleVC, tasksVC, contactsVC]
    }
    
    func creatNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController{
        
        //создаем таб бар и с помощью withAlignmentRectInsets выравниваем
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        //выравниваем надпись
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
    
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }

}

