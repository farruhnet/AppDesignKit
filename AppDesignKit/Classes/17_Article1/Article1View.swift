//
// Copyright (c) 2020 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-------------------------------------------------------------------------------------------------------------------------------------------------
class Article1View: UIViewController {

	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelCategory: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var imageUser: UIImageView!
	@IBOutlet var labelUsername: UILabel!
	@IBOutlet var labelLocation: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonMessage: UIButton!
	@IBOutlet var viewMessageCount: UIView!
	@IBOutlet var labelMessageCount: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonFont = UIBarButtonItem(image: UIImage(systemName: "text.cursor"), style: .plain, target: self, action: #selector(actionFont(_:)))
		let buttonBookmark = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: self, action: #selector(actionBookmark(_:)))
		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))
		navigationItem.rightBarButtonItems = [buttonShare, buttonBookmark, buttonFont]

		buttonMessage.layer.borderWidth = 1
		buttonMessage.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		if let navController = navigationController as? NavigationController {
			navController.setBackground(color: .clear)
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)

		if let navBar = navigationController as? NavigationController {
			navBar.setNavigationBar()
		}
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageNews.sample("Reader", "Traffic", 2)
		imageUser.sample("Reader", "News", 18)
		labelCategory.text = "Technology".uppercased()
		labelDate.text = "26 MAR 2020"
		labelTitle.text = "Surging Traffic Is Slowing Down Our Internet"
		labelUsername.text = "New York Times"
		labelLocation.text = "California"
		labelDescription.text = """
		WASHINGTON — In late January, as China locked down some provinces to contain the spread of the coronavirus, average internet speeds in the country slowed as people who were stuck inside went online more and clogged the networks. In Hubei Province, the epicenter of infections, mobile broadband speeds fell by more than half.

		In mid-February, when the virus hit Italy, Germany and Spain, internet speeds in those countries also began to deteriorate.

		And last week, as a wave of stay-at-home orders rolled out across the United States, the average time it took to download videos, emails and documents increased as broadband speeds declined 4.9 percent from the previous week, according to Ookla, a broadband speed testing service. Median download speeds dropped 38 percent in San Jose, Calif., and 24 percent in New York, according to Broadband Now, a consumer broadband research site.

		Quarantines around the world have made people more reliant on the internet to communicate, work, learn and stay entertained. But as the use of YouTube, Netflix, Zoom videoconferencing, Facebook calls and videogaming has surged to new highs, the stress on internet infrastructure is starting to show in Europe and the United States — and the traffic is probably far from its peak.
		"""
		labelMessageCount.text = "248"
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFont(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionBookmark(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMessage(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UIScrollViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Article1View: UIScrollViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidScroll(_ scrollView: UIScrollView) {

		if scrollView.tag == 11 {
			if let navController = navigationController as? NavigationController {
				if (scrollView.contentOffset.y > imageNews.frame.size.height/2) {
					navController.setBackground(color: .systemBackground)
				} else {
					navController.setBackground(color: .clear)
				}
			}
		}
	}
}
