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
class MyLibrary1View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var iamgeUser: UIImageView!

	@IBOutlet var tableView: UITableView!
	@IBOutlet var collectionViewBooks: UICollectionView!
	@IBOutlet var collectionViewPDFs: UICollectionView!

	@IBOutlet var viewHeaderBooks: UIView!
	@IBOutlet var viewHeaderAudiobooks: UIView!
	@IBOutlet var viewHeaderPDFs: UIView!

	@IBOutlet var cellBooks: UITableViewCell!
	@IBOutlet var cellPDFs: UITableViewCell!

	private var selectedMenuIndex = 0
	private var books = ["", "", ""]
	private var audiobooks: [[String: String]] = []
	private var pdfs = ["", "", ""]

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.isHidden = true

		collectionViewBooks.register(UINib(nibName: "MyLibrary1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "MyLibrary1Cell1")
		collectionViewPDFs.register(UINib(nibName: "MyLibrary1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "MyLibrary1Cell1")

		tableView.register(UINib(nibName: "MyLibrary1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "MyLibrary1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		iamgeUser.sample("Social", "Portraits", 9)
		labelSubTitle.text = "96 books"

		audiobooks.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "You Must Know Everything"
		dict1["author"] = "Babel, Isaac"
		dict1["duration"] = "06:38:00"
		audiobooks.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Don't Overthink It"
		dict2["author"] = "Anne Bogel"
		dict2["duration"] = "4:28:00"
		audiobooks.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "What's after Life?"
		dict3["author"] = "John Burke"
		dict3["duration"] = "1:41:00"
		audiobooks.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "My Dark Vanessa"
		dict4["author"] = "Kate Elizabeth Russell"
		dict4["duration"] = "15:37:00"
		audiobooks.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Master Successful Personal Habits"
		dict5["author"] = "Tom Ziglar, Zig Ziglar"
		dict5["duration"] = "8:51:00"
		audiobooks.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionBooksSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPDFsSeeAll(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension MyLibrary1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 1				}
		if (section == 1) { return audiobooks.count	}
		if (section == 2) { return 1				}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) { return cellBooks	}

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "MyLibrary1Cell2", for: indexPath) as! MyLibrary1Cell2
			cell.bindData(index: indexPath.item, data: audiobooks[indexPath.row])
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			return cell
		}

		if (indexPath.section == 2) { return cellPDFs	}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension MyLibrary1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (indexPath.section == 1) {

		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 50 }
		if (section == 1) { return 50 }
		if (section == 2) { return 50 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return viewHeaderBooks		}
		if (section == 1) { return viewHeaderAudiobooks	}
		if (section == 2) { return viewHeaderPDFs		}

		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 150	}
		if (indexPath.section == 1) { return 75		}
		if (indexPath.section == 2) { return 150	}

		return 0
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension MyLibrary1View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		if (collectionView == collectionViewBooks) { return 1	}
		if (collectionView == collectionViewPDFs) { return 1	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewBooks) { return books.count	}
		if (collectionView == collectionViewPDFs) { return pdfs.count	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewBooks) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyLibrary1Cell1", for: indexPath) as! MyLibrary1Cell1
			cell.bindData(index: indexPath.item)
			return cell
		}

		if (collectionView == collectionViewPDFs) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyLibrary1Cell1", for: indexPath) as! MyLibrary1Cell1
			cell.bindData(index: indexPath.item + 3)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension MyLibrary1View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionViewBooks) { }
		if (collectionView == collectionViewPDFs) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension MyLibrary1View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height

		if (collectionView == collectionViewBooks) { return CGSize(width: (width-60)/3, height: height) }
		if (collectionView == collectionViewPDFs) { return CGSize(width: (width-60)/3, height: height) }

		return CGSize.zero
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewBooks) { return 15	}
		if (collectionView == collectionViewPDFs) { return 15	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewBooks) { return 15	}
		if (collectionView == collectionViewPDFs) { return 15	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewBooks) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)	}
		if (collectionView == collectionViewPDFs) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)		}

		return UIEdgeInsets.zero
	}
}
