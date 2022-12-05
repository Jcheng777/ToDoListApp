//
//  ViewController.swift
//  jc2755_p2
//
//  Created by Jesse Cheng on 10/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Set Variables
    var reminderImage = UIImageView()
    var titleLabel = UILabel()
    var dividerImage1 = UIImageView()
    var subTitleLabel1 = UILabel()
//    var dueDateField = UITextField()
//    var reminderField = UITextField()
    var addReminderButton = UIButton()
    var subTitleLabel2 = UILabel()
    var dividerImage2 = UIImageView()
    var listOfReminders = UITextView()
    
    class TextFieldWithPadding: UITextField {
        var textPadding = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
                let rect = super.textRect(forBounds: bounds)
                return rect.inset(by: textPadding)
            }

            override func editingRect(forBounds bounds: CGRect) -> CGRect {
                let rect = super.editingRect(forBounds: bounds)
                return rect.inset(by: textPadding)
            }
    }
    
    var dueDateField = TextFieldWithPadding()
    var reminderField = TextFieldWithPadding()
    
    // Bool Variables
    var didDueDateChange : Bool = false
    var didReminderChange : Bool = false

    // Global Variable
    var reminderList: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        // Set Properties and SubView
        
        reminderImage.image = UIImage(named: "ReminderImage")
        reminderImage.contentMode = .scaleAspectFit
        reminderImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reminderImage)
        
        titleLabel.text = "Reminders"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        subTitleLabel1.text = "write something new"
        subTitleLabel1.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        subTitleLabel1.font = .systemFont(ofSize: 15, weight: .bold)
        subTitleLabel1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subTitleLabel1)
        
        dividerImage1.image = UIImage(named: "line")
        dividerImage1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dividerImage1)
        
        dueDateField.placeholder = "Due Date"
        dueDateField.textAlignment = NSTextAlignment.left
        dueDateField.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        dueDateField.font = .systemFont(ofSize: 15)
        dueDateField.layer.borderWidth = 1
        dueDateField.layer.borderColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1).cgColor
        dueDateField.layer.cornerRadius = 20
        dueDateField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dueDateField)
        
        reminderField.placeholder = "Reminder"
        reminderField.textAlignment = NSTextAlignment.left
        reminderField.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        reminderField.font = .systemFont(ofSize: 15)
        reminderField.layer.borderWidth = 1
        reminderField.layer.borderColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1).cgColor
        reminderField.layer.cornerRadius = 20
        reminderField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reminderField)

        addReminderButton.setTitle("ADD NEW REMINDER >", for: .normal)
        addReminderButton.titleLabel?.font = .systemFont(ofSize: 12.5, weight: .bold)
        addReminderButton.setTitleColor(UIColor(red: 0.251, green: 0.325, blue: 0.98, alpha: 1), for: .normal)
        addReminderButton.translatesAutoresizingMaskIntoConstraints = false
        addReminderButton.addTarget(self, action: #selector(didPressReminderButton), for: .touchUpInside)
        view.addSubview(addReminderButton)
        
        subTitleLabel2.text = "all reminders"
        subTitleLabel2.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        subTitleLabel2.font = .systemFont(ofSize: 15, weight: .bold)
        subTitleLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subTitleLabel2)
        
        dividerImage2.image = UIImage(named: "line")
        dividerImage2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dividerImage2)
        
        listOfReminders.text = "Add a reminder..."
        listOfReminders.textColor = UIColor(red: 0.804, green: 0.804, blue: 0.804, alpha: 1)
        listOfReminders.font = .systemFont(ofSize: 13)
        listOfReminders.isEditable = false
        listOfReminders.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listOfReminders)
        
        // Set Constraints
        
        // reminderImage
        NSLayoutConstraint.activate([
            reminderImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            reminderImage.widthAnchor.constraint(equalToConstant: 360),
            reminderImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: reminderImage.bottomAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // subTitleLabel1
        NSLayoutConstraint.activate([
            subTitleLabel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subTitleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
    
        // dividerImage1
        NSLayoutConstraint.activate([
            dividerImage1.topAnchor.constraint(equalTo: subTitleLabel1.bottomAnchor, constant: 5),
            dividerImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // dueDateField
        NSLayoutConstraint.activate([
            dueDateField.topAnchor.constraint(equalTo: dividerImage1.bottomAnchor, constant: 8),
            dueDateField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            dueDateField.widthAnchor.constraint(equalToConstant: 148),
            dueDateField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // reminderField
        NSLayoutConstraint.activate([
            reminderField.topAnchor.constraint(equalTo: dueDateField.bottomAnchor, constant: 8),
            reminderField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
            reminderField.widthAnchor.constraint(equalToConstant: 343),
            reminderField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // addReminderButton
        NSLayoutConstraint.activate([
            addReminderButton.topAnchor.constraint(equalTo: reminderField.bottomAnchor, constant: 14),
            addReminderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 ),
            addReminderButton.widthAnchor.constraint(equalToConstant: 146),
            addReminderButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // subTitleLabel2
        NSLayoutConstraint.activate([
            subTitleLabel2.topAnchor.constraint(equalTo: addReminderButton.bottomAnchor, constant: 18),
            subTitleLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // dividerImage2
        NSLayoutConstraint.activate([
            dividerImage2.topAnchor.constraint(equalTo: subTitleLabel2.bottomAnchor, constant: 5),
            dividerImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19)
        ])
        
        // listOfReminders
        NSLayoutConstraint.activate([
            listOfReminders.topAnchor.constraint(equalTo: dividerImage2.bottomAnchor, constant: 5),
            // Change the width and height of the image
            listOfReminders.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            listOfReminders.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            listOfReminders.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])

    }
    
    
    @objc
    func didPressReminderButton() {
        if let unwrappedField1 = dueDateField.text {
            if let unwrappedField2 = reminderField.text {
                if (unwrappedField1 != "" && unwrappedField2 != "") {
                    listOfReminders.text = createStringList(unwrappedField1, unwrappedField2)
                    listOfReminders.textColor = .black
                    listOfReminders.font = .systemFont(ofSize: 13)
                }
                else {
                    let dueDateAlert = UIAlertController()
                    dueDateAlert.title = "Alert"
                    dueDateAlert.message = "Both text fields should be filled."
                    dueDateAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(dueDateAlert, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    
    @objc
    func createStringList(_ field1: String, _ field2: String) -> String {
        var newString: String = ""

        reminderList.append("- \(field1) \(field2)\n")
        
        for i in 0...reminderList.count-1 {
            newString += reminderList[i]
        }
        return newString
    }


}

