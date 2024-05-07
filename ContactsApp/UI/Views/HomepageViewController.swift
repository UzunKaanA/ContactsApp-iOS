//
//  ViewController.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 5.05.2024.
//

import UIKit

class HomepageViewController: UIViewController {

  @IBOutlet weak var searchBar: UISearchBar!
  var contactsList = [Kisiler]()

  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self //-> SearchBar's delegate to self -> UISearchBarDelegate connection.
    contactsTableView.delegate = self
    contactsTableView.dataSource = self

    let c1 = Kisiler(kisi_id: 1, kisi_ad: "Zeynep", kisi_tel: "1111")
    let c2 = Kisiler(kisi_id: 2, kisi_ad: "Kaan", kisi_tel: "2222")
    let c3 = Kisiler(kisi_id: 3, kisi_ad: "Yigit", kisi_tel: "3333")
    contactsList.append(c1)
    contactsList.append(c2)
    contactsList.append(c3)
  }

  @IBOutlet weak var contactsTableView: UITableView!
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetails" {
      if let contact = sender as? Kisiler { //Downcasting from Any
        let destinationVC = segue.destination as! ContactDetailsViewController    //Sending the contact X to Details Page.
        destinationVC.contact = contact
      }
    }
  }

}

extension HomepageViewController : UISearchBarDelegate {
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("Search Contact: \(searchText)")
  }

}


//MARK: TableView
extension HomepageViewController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contactsList.count  //will run this much* * *
  }
  
  //Giving data to rows
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell") as! ContactsTableViewCell

    let contactPerson = contactsList[indexPath.row]
    cell.labelName.text = contactPerson.kisi_ad
    cell.labelNumber.text = contactPerson.kisi_tel

    return cell
  }

  //Selecting row
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let contactPerson = contactsList[indexPath.row]
    //sending data to the "Contact Details Page" with an identifier
    performSegue(withIdentifier: "toDetails", sender: contactPerson)
    //removes the UIview of the "stuck" selected row view.
    tableView.deselectRow(at: indexPath, animated: true)
  }

  func tableView(
    _ tableView: UITableView,
    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
  ) -> UISwipeActionsConfiguration? {

    let deleteAction = UIContextualAction(
      style: .destructive,
      title: "Delete"
    ){
      contexualAction,view,bool in

      let contactPerson = self.contactsList[indexPath.row]

      let alert = UIAlertController(title: "Deletion", message: "\(contactPerson.kisi_ad!) + Are you sure to delete?", preferredStyle: .alert)

      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
      alert.addAction(cancelAction)
      let eventAction = UIAlertAction(title: "Yes", style: .destructive){ _ in
        print("Delete Contact: \(contactPerson.kisi_id!)")
      }
      alert.addAction(eventAction)

      self.present(alert, animated: true)
    }
    return UISwipeActionsConfiguration(actions: [deleteAction])
  }

}
