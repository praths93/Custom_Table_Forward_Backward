
import UIKit

class EmployeeDetailsViewController: UIViewController {
//MARK: Outlets
    @IBOutlet weak var empIdNo: UITextField!
    @IBOutlet weak var empName: UITextField!
    @IBOutlet weak var empContact: UITextField!
    @IBOutlet weak var empDepartment: UITextField!
//MARK: Global Variables
    var empClosure: ((_ id: Int?,_ name:String?,_ contact:Int?,_ department:String?)->())?
//MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                                 target: self,
                                                                 action: #selector(addEmployeeDetailsButtonAction))
    }
    //MARK: Add Button Action -> Employee Details
    @objc func addEmployeeDetailsButtonAction() {
       if let closure = empClosure {
            let idC = Int(self.empIdNo.text ?? "Invaild")
            let nameC = self.empName.text
            let contactC = Int(self.empContact.text ?? "Inavild")
            let depC = self.empDepartment.text
           
           closure(idC,nameC,contactC,depC)
       } else {
           print("Closure is Nil")
       }
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func checkEmpDetailsButtonAction() {
        guard let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "DisplayEmployeeDetailsViewController") as? DisplayEmployeeDetailsViewController else {
            print("DisplayEmployeeDetailsViewController is Not Present as an Identifier of VC3")
            return
        }
        vc3.empId2 = Int(self.empIdNo.text ?? "Invaild")
        vc3.empName2 = self.empName.text
        vc3.empContact2 = Int(self.empContact.text ?? "Invaild")
        vc3.empDepartment2 = self.empDepartment.text
        self.navigationController?.pushViewController(vc3, animated: true)
    }
}

