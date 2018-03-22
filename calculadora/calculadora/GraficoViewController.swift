
import UIKit

class GraficoViewController: UIViewController {

    public var equacao : Equacao?
    
    @IBOutlet weak var displayEquacao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEquacao.text = equacao?.texto
    }
    
    
    
    
    
}
