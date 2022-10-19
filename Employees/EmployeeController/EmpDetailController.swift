//
//  EmpDetailController.swift
//  Employees
//
//  Created by Sathya on 24/08/22.
//

import UIKit

class EmpDetailController: UIViewController {
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var uname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var cprase: UILabel!
    @IBOutlet weak var cname: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var bsVal: UILabel!
    public var employeeDetail = EmployeeData()
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        self.title = "Employee Detail"
        // Do any additional setup after loading the view.
    }
    
    func setValues() {
        profile.sd_setImage(with: URL(string: employeeDetail.profileImage ?? ""), placeholderImage: UIImage(named: "userDefault"))
        name.text = employeeDetail.name
        phone.text = employeeDetail.phone
        uname.text = employeeDetail.username
        email.text = employeeDetail.email
        address.text = "\(employeeDetail.address?.suite ?? "" ), \(employeeDetail.address?.street ?? ""), \(employeeDetail.address?.city ?? ""), \(employeeDetail.address?.zipcode ?? "")"
        website.text = employeeDetail.website
        cname.text = employeeDetail.company?.name
        cprase.text = employeeDetail.company?.catchPhrase
        bsVal.text = employeeDetail.company?.bs
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
