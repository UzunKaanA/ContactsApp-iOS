//
//  ContactRegisterViewController.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 5.05.2024.
//

import UIKit

class ContactRegisterViewController: UIViewController {

  @IBOutlet weak var tfContactNumber: UITextField!
  @IBOutlet weak var tfContactName: UITextField!

  override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func buttonSave(_ sender: Any) {
    if let name = tfContactName.text, let number = tfContactNumber.text {
      contactSave(contact_name: name, contact_number: number)
    }
  }

  func contactSave(contact_name:String, contact_number:String) {
    print(("Contact Register: \(contact_name) + \(contact_number)"))
  }

}
