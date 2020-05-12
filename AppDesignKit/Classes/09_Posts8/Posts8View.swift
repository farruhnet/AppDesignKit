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
class Posts8View: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!
	@IBOutlet var buttonClose: UIButton!

	private var news: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		collectionView.register(UINib(nibName: "Posts8Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "Posts8Cell")

		buttonClose.layer.borderWidth = 1
		buttonClose.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Politics"
		dict1["date"] = "17 MAR 2020"
		dict1["title"] = "The 2020 Debate Over Health Care Is Getting ‘a Lot More Real’"
		dict1["comments"] = "322"
		dict1["views"] = "30.1k"
		news.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Business"
		dict2["date"] = "24 MAR 2020"
		dict2["title"] = "More Than 3 Million in U.S. Filed for Unemployment Last Week: Live Updates"
		dict2["comments"] = "910"
		dict2["views"] = "40.8k"
		news.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Opinion"
		dict3["date"] = "15 MAR 2020"
		dict3["title"] = "Trump Wants to ‘Reopen America.’ Here’s What Happens if We Do."
		dict3["comments"] = "468"
		dict3["views"] = "30.3k"
		news.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Tech"
		dict4["date"] = "14 MAR 2020"
		dict4["title"] = "Facebook Is ‘Just Trying to Keep the Lights On’ as Traffic Soars in Pandemic"
		dict4["comments"] = "139"
		dict4["views"] = "37.8k"
		news.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Science"
		dict5["date"] = "14 MAR 2020"
		dict5["title"] = "Life on the Planet Mercury? ‘It’s Not Completely Nuts’"
		dict5["comments"] = "778"
		dict5["views"] = "44.9k"
		news.append(dict5)

		var dict6: [String: String] = [:]
		dict6["category"] = "Health"
		dict6["date"] = "10 MAR 2020"
		dict6["title"] = "Amid Desperate Need for Ventilators, Calls Grow for Federal Intervention"
		dict6["comments"] = "907"
		dict6["views"] = "41.7k"
		news.append(dict6)

		var dict7: [String: String] = [:]
		dict7["category"] = "Sports"
		dict7["date"] = "19 MAR 2020"
		dict7["title"] = "A Year of ‘What If’ for the N.B.A."
		dict7["comments"] = "579"
		dict7["views"] = "19.5k"
		news.append(dict7)

		var dict8: [String: String] = [:]
		dict8["category"] = "Arts"
		dict8["date"] = "15 MAR 2020"
		dict8["title"] = "Online, the Show Goes On. But It’s Just Not the Same."
		dict8["comments"] = "364"
		dict8["views"] = "49.8k"
		news.append(dict8)

		var dict9: [String: String] = [:]
		dict9["category"] = "Books"
		dict9["date"] = "11 MAR 2020"
		dict9["title"] = "‘Threshold’ Resurrects the Angry, Ambitious Young Man"
		dict9["comments"] = "470"
		dict9["views"] = "13.5k"
		news.append(dict9)

		pageControl.currentPage = 0
		pageControl.numberOfPages = news.count

		refreshCategories()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCategories() {

		collectionView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Posts8View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return news.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Posts8Cell", for: indexPath) as! Posts8Cell
		cell.bindData(index: indexPath.item, data: news[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Posts8View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Posts8View: UICollectionViewDelegateFlowLayout {

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
extension Posts8View: UIScrollViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
