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
class FeaturedBooks1View: UIViewController {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var collectionViewSlider: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!

	@IBOutlet var collectionViewNewBooks: UICollectionView!

	private var sliders: [[String: String]] = []
	private var books: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		collectionViewSlider.register(UINib(nibName: "FeaturedBooks1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "FeaturedBooks1Cell1")
		collectionViewNewBooks.register(UINib(nibName: "FeaturedBooks1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "FeaturedBooks1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageView.sample("Reader", "News", 7)
		labelSubTitle.text = "Books, Magazines and Audiobooks"

		sliders.removeAll()
		books.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Editor's choice"
		dict1["title"] = "21 Books You’ve Been Meaning To Read"
		dict1["description"] = "Reading lists begin as a shelf full of hope"
		sliders.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Recommended"
		dict2["title"] = "Start Here: The Best Books of All-Time"
		dict2["description"] = "Looking for more good books to read?"
		sliders.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Inspirational"
		dict3["title"] = "The 40 best books to read while you’re self-isolating"
		dict3["description"] = "It's worth reading at least once."
		sliders.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "How to Win Friends and Influence People"
		dict4["author"] = "Dale Carnegie"
		books.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Dear Stranger, I Know How You Feel"
		dict5["author"] = "Ashish Bagrecha"
		books.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Who Moved My Cheese?"
		dict6["author"] = "Spencer Johnson"
		books.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The Magic of Thinking Big"
		dict7["author"] = "David J. Schwartz"
		books.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Think & Grow Rich"
		dict8["author"] = "Napolean Hill"
		books.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "The Power of Positive Thinking"
		dict9["author"] = "Norman Vincent Peale"
		books.append(dict9)

		pageControl.numberOfPages = sliders.count

		refreshCollectionViewSlider()
		refreshCollectionViewNewBooks()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewSlider() {

		collectionViewSlider.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewNewBooks() {

		collectionViewNewBooks.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAll(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks1View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewSlider)		{ return sliders.count }
		if (collectionView == collectionViewNewBooks)	{ return books.count }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewSlider) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedBooks1Cell1", for: indexPath) as! FeaturedBooks1Cell1
			cell.bindData(index: indexPath.item, data: sliders[indexPath.row])
			return cell
		}

		if (collectionView == collectionViewNewBooks) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedBooks1Cell2", for: indexPath) as! FeaturedBooks1Cell2
			cell.bindData(index: indexPath.item, data: books[indexPath.row])
			cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks1View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionViewSlider) {

		}
		if (collectionView == collectionViewNewBooks) {

		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks1View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		if (collectionView == collectionViewSlider) {
			return collectionView.frame.size
		}
		if (collectionView == collectionViewNewBooks) {
			let width = (collectionView.frame.size.width)/3
			return CGSize(width: width, height: 240)
		}

		return CGSize.zero
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider)		{ return 0 }
		if (collectionView == collectionViewNewBooks)	{ return 15 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewSlider)		{ return 0 }
		if (collectionView == collectionViewNewBooks)	{ return 15 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewSlider)		{ return UIEdgeInsets.zero }
		if (collectionView == collectionViewNewBooks)	{ return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) }

		return UIEdgeInsets.zero
	}
}

// MARK: - UIScrollViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension FeaturedBooks1View: UIScrollViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

		let visibleRect = CGRect(origin: collectionViewSlider.contentOffset, size: collectionViewSlider.bounds.size)
		let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

		if let visibleIndexPath = collectionViewSlider.indexPathForItem(at: visiblePoint) {
			pageControl.currentPage = visibleIndexPath.row
		}
	}
}
