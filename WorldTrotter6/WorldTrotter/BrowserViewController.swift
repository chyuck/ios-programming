import UIKit
import WebKit

class BrowserViewController : UIViewController {
    
    var browserView: WKWebView!
    
    override func loadView() {
        browserView = WKWebView()
        
        view = browserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.bignerdranch.com/")
        let urlRequest = URLRequest(url: url!)
        browserView.load(urlRequest)
    }
}
