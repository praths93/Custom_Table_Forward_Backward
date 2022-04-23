
import UIKit

class EmployeeDetailsViewController: UIViewController {
//MARK: Outlets
    @IBOutlet weak var empIdNo: UITextField!
    @IBOutlet weak var empName: UITextField!
    @IBOutlet weak var empContact: UITextField!
    @IBOutlet weak var empDepartment: UITextField!    
//MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addEmployeeDetailsButtonAction))
    }
    //MARK: Add Button Action -> Employee Details
    @objc func addEmployeeDetailsButtonAction() {
        guard let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "DisplayEmployeeDetailsViewController") as? DisplayEmployeeDetailsViewController else {
            print("DisplayEmployeeDetailsViewController is Not Present as an Identifier of VC2")
            return
        }
        vc2.empId2 = Int(self.empIdNo.text ?? "Invaild")
        vc2.empName2 = self.empName.text
        vc2.empContact2 = Int(self.empContact.text ?? "Invaild")
        vc2.empDepartment2 = self.empDepartment.text
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}

