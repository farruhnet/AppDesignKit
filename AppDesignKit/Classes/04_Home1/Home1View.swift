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
class Home1View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageUserProfile: UIImageView!
	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!

	private var newsSlider: [[String: String]] = []
	private var news: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		collectionView.register(UINib(nibName: "Home1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home1Cell1")
		tableView.register(UINib(nibName: "Home1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Home1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageUserProfile.sample("Social", "Profiles", 15)
		labelTitle.text = "Newspaper"
		labelSubTitle.text = "Friday, April 21"
		
		newsSlider.removeAll()
		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["date"] = "08 MAR 2020"
		dict1["title"] = "What Made New York So Hospitable for Coronavirus?"
		dict1["author"] = "Fox News"
		newsSlider.append(dict1)

		var dict2: [String: String] = [:]
		dict2["date"] = "20 MAR 2020"
		dict2["title"] = "Last known survivor of transatlantic slave trade identified"
		dict2["author"] = "BBC News"
		newsSlider.append(dict2)

		var dict3: [String: String] = [:]
		dict3["date"] = "19 MAR 2020"
		dict3["title"] = "White House coordinator: My grandmother had to live with this for 88 years"
		dict3["author"] = "The Atlantic"
		newsSlider.append(dict3)

		var dict4: [String: String] = [:]
		dict4["date"] = "09 MAR 2020"
		dict4["title"] = "Idris Elba hits back at claims he is lying about coronavirus"
		dict4["author"] = "Washington Examiner"
		newsSlider.append(dict4)

		var dict5: [String: String] = [:]
		dict5["date"] = "12 MAR 2020"
		dict5["title"] = "Questions arise after teen's death was initially linked to coronavirus in California"
		dict5["author"] = "Us Weekly"
		newsSlider.append(dict5)

		var dict6: [String: String] = [:]
		dict6["date"] = "09 MAR 2020"
		dict6["title"] = "Video reveals lung damage in US coronavirus patient: 'People need to take this seriously'"
		dict6["author"] = "New York Times"
		newsSlider.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "08 MAR 2020"
		dict7["title"] = "In a world consumer by fear, marble racing proves welcome distraction"
		news.append(dict7)

		var dict8: [String: String] = [:]
		dict8["date"] = "10 MAR 2020"
		dict8["title"] = "Instacart plans to hire 300,000 more workers as demand surges for grocery deliveries"
		news.append(dict8)

		var dict9: [String: String] = [:]
		dict9["date"] = "04 MAR 2020"
		dict9["title"] = "We’re in Disaster Mode’: Courage Inside a Brooklyn Hospital"
		news.append(dict9)

		var dict10: [String: String] = [:]
		dict10["date"] = "20 MAR 2020"
		dict10["title"] = "Europe’s Leaders Ditch Austerity and Fight Pandemic With Cash"
		news.append(dict10)

		var dict11: [String: String] = [:]
		dict11["date"] = "15 MAR 2020"
		dict11["title"] = "NYC’s Elmhurst Hospital at coronavirus breaking point as 13 patients die in 24-hour span"
		news.append(dict11)

		var dict12: [String: String] = [:]
		dict12["date"] = "17 MAR 2020"
		dict12["title"] = "Rep. Doug Collins says Congress looking at new ways to vote as coronavirus keeps lawmakers home"
		news.append(dict12)

		pageControl.numberOfPages = newsSlider.count

		refreshCollectionView()
		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionView() {

		collectionView.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return newsSlider.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home1Cell1", for: indexPath) as! Home1Cell1
		cell.bindData(index: indexPath.item, data: newsSlider[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UIScrollViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return news.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Home1Cell2", for: indexPath) as! Home1Cell2
		cell.bindData(index: indexPath.item, data: news[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		layoutConstraintTableViewHeight.constant = CGFloat(news.count*90)
		return 90
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
