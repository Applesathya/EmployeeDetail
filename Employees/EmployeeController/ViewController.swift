//
//  ViewController.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//

import UIKit
import RealmSwift
import SDWebImage
class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var employeeList: UITableView!
    
    var allEmployeeData = [EmployeeData()]
    var allEmployeeDataSearch = [EmployeeData()]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    func initialSetup() {
        // made initial setup
        setUpSearchBar()
        if Utility.getFlag(forKey: "isEmpSaved") {
            getEmployees()
        }else
        {
            saveEmp()
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    func setUpSearchBar() {
        searchBar.showsScopeBar = false
        searchBar.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty  else { allEmployeeData = allEmployeeDataSearch;
            employeeList.reloadData()
            return }
        
        allEmployeeData.removeAll()
        allEmployeeData = allEmployeeDataSearch.filter({ employee -> Bool in
            return employee.name.lowercased().contains(searchText.lowercased()) || employee.email.lowercased().contains(searchText.lowercased())
        })
        employeeList.reloadData()
    }
    
    func getEmployees() {
        let employeeManager = EmployeeManager()
        allEmployeeDataSearch  = employeeManager.getAllEmployees()
        allEmployeeData = allEmployeeDataSearch
        employeeList.reloadData()
    }
    
    func saveEmp() {
        let apiService = ApiService ()
        apiService.getApi().responseJSON { (response) in
            switch response.result {
            case .success:
                let jsonData = response.data
                do{
                    let userData = try JSONDecoder().decode(Employee.self, from: jsonData!)
                    print(userData)
                    let employeeManager = EmployeeManager()
                    employeeManager.saveEmployees(emps: userData)
                    Utility.saveFlag(flag: true, forKey: "isEmpSaved")
                    self.getEmployees()
                }catch let error{
                    print(error)
                }
                break
            case .failure( _): break
            }
            
        }
    }
}
extension  ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEmployeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "employee") as! TableViewCell
        let cellEmp = allEmployeeData[indexPath.row]
        cell.name.text = cellEmp.name
        cell.company.text = cellEmp.company?.name
        cell.profileImage.sd_setImage(with: URL(string: cellEmp.profileImage ?? ""), placeholderImage: UIImage(named: "userDefault"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmpDetailController") as? EmpDetailController
        vc?.employeeDetail = allEmployeeData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

