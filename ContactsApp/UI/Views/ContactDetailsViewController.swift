//
//  ContactDetailsViewController.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 5.05.2024.
//

import UIKit

class ContactDetailsViewController: UIViewController {

  @IBOutlet weak var tfContactName: UITextField!
  @IBOutlet weak var tfContactNumber: UITextField!

  var contact:Kisiler?

  override func viewDidLoad() {
    super.viewDidLoad()
    if let c = contact{
      tfContactName.text = c.kisi_ad
      tfContactNumber.text = c.kisi_tel
    }
  }

  @IBAction func buttonUpdate(_ sender: Any) {
    if let c = contact, 
        let name = tfContactName.text,
        let num = tfContactNumber.text 
    {
      update(contact_id: c.kisi_id!, contact_name: name, contact_number: num)
      //Update the Name and Number that the user changed through details page but not ID
    }
  }

  func update(contact_id:Int, contact_name:String, contact_number:String){
    print(("Contact Updated: \(contact_id) + \(contact_name) + \(contact_number)"))
  }

}
