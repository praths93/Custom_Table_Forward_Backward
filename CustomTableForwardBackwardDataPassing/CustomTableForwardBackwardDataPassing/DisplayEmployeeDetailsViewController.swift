import UIKit

class DisplayEmployeeDetailsViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    //MARK: Global Variables
    var empId2: Int?
    var empName2: String?
    var empContact2: Int?
    var empDepartment2: String?
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = String(describing: empId2 ?? 0)
        nameLabel.text = empName2
        contactLabel.text = String(describing: empContact2 ?? 0)
        departmentLabel.text = empDepartment2


        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveEmployeeDetailsButtonAction))
    }
    //MARK: Save Button Action -> Employee Details
    @objc func saveEmployeeDetailsButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
