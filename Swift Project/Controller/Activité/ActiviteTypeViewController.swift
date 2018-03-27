
import UIKit
import CoreData

class ActiviteTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var picker: UIPickerView!
    
    let segueShowNomActivite = "showNomActiviteSegue"
     var typesactivite : [TypeActivite] = []
     var activitePasse = TypeActivite() 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueShowNomActivite {
            let alarmActivite = segue.destination as! ActiviteJoursViewController
            alarmActivite.nomActivite = activitePasse
        }
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        let daoF = CoreDataDAOFactory.getInstance()
        let typeActiviteDAO = daoF.getTypeActiviteDAO()
        
        
        do{
            try self.typesactivite = typeActiviteDAO.getAll()!
            if self.typesactivite.isEmpty == false {
                print(self.typesactivite[0])
                self.activitePasse = self.typesactivite[0]
            }
        }catch{
            
            }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typesactivite.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesactivite[row].libelleTypeActivite
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        activitePasse = typesactivite[row]
    }
    
}

