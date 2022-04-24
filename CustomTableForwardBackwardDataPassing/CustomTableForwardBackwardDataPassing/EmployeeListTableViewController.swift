import UIKit

class EmployeeListTableViewController: UIViewController {
    //MARK: Outlet
    @IBOutlet weak var employeeTableView: UITableView!
    //MARK: Global Variables
    var idArray: [Int] = []
    var nameArray: [String] = []
    var contactArray: [Int] = []
    var departmentArray: [String] = []
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(addEmployeeDetailsButtonAction))
        let nibName = UINib(nibName: "EmployeeDetailsTableViewCell", bundle: .main)
        employeeTableView.register(nibName, forCellReuseIdentifier: "EmployeeDetailsTableViewCell")
    }
    //MARK: Add Button Action -> Employee Details
    @objc func addEmployeeDetailsButtonAction() {
        guard let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as? EmployeeDetailsViewController else {
            print("EmployeeDetailsViewController is Not Present as an Identifier of VC2")
            return
        }
        vc2.empClosure = { (id,name,contact,department) in
            self.idArray.append(id ?? 0)
            self.nameArray.append(name ?? "No value")
            self.contactArray.append(contact ?? 0)
            self.departmentArray.append(department ?? "No value")
            
            self.employeeTableView.reloadData()
            
        }
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
extension EmployeeListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.employeeTableView.dequeueReusableCell(withIdentifier: "EmployeeDetailsTableViewCell") as? EmployeeDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.idLabel.text = "\(idArray[indexPath.row])"
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.contactLabel.text = "\(contactArray[indexPath.row])"
        cell.departmentLabel.text = departmentArray[indexPath.row]
        
        return cell
    }
}
extension EmployeeListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
}
