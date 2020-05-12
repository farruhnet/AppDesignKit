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
class TextOptions1View: UIViewController {

	@IBOutlet var collectionViewFont: UICollectionView!
	@IBOutlet var collectionViewColor: UICollectionView!
	@IBOutlet var slider: UISlider!

	private var font: [String] = []
	private var color: [String] = []
	private var selectedFontIndex = 0

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonFont = UIBarButtonItem(image: UIImage(systemName: "text.cursor"), style: .plain, target: self, action: #selector(actionFont(_:)))
		let buttonBookmark = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: self, action: #selector(actionBookmark(_:)))
		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))
		navigationItem.rightBarButtonItems = [buttonShare, buttonBookmark, buttonFont]

		collectionViewFont.register(UINib(nibName: "TextOptions1Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "TextOptions1Cell1")
		collectionViewColor.register(UINib(nibName: "TextOptions1Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "TextOptions1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		font.removeAll()
		color.removeAll()

		font.append("Arial")
		font.append("SF UI Pro")
		font.append("Times")
		font.append("Baskerville")
		font.append("Tahoma")
		font.append("Helvetica")

		color.append("Light")
		color.append("Dark")
		color.append("Gray")

		refreshCollectionViewFont()
		refreshCollectionViewColor()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewFont() {

		collectionViewFont.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewColor() {

		collectionViewColor.reloadData()
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
	@IBAction func actionSlider(_ sender: UISlider) {

		print(sender.value)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TextOptions1View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		if (collectionView == collectionViewFont) { return font.count	}
		if (collectionView == collectionViewColor) { return color.count	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (collectionView == collectionViewFont) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextOptions1Cell1", for: indexPath) as! TextOptions1Cell1
			cell.bindData(title: font[indexPath.row])
			cell.labelTitle.textColor = (selectedFontIndex == indexPath.row) ? AppColor.Theme : UIColor.label
			return cell
		}

		if (collectionView == collectionViewColor) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextOptions1Cell2", for: indexPath) as! TextOptions1Cell2
			cell.bindData(title: color[indexPath.row])
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TextOptions1View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")

		if (collectionView == collectionViewFont) {
			selectedFontIndex = indexPath.row
			collectionView.reloadData()
		}
		if (collectionView == collectionViewColor) {

		}
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TextOptions1View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height

		if (collectionView == collectionViewFont) {
			let textWidth = font[indexPath.row].width(withConstrainedHeight: 40, font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold))

			let width = textWidth + 10
			return CGSize(width: width, height: height)
		}
		if (collectionView == collectionViewColor) {
			return CGSize(width: (width-60)/3, height: height-15)
		}

		return CGSize.zero
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewFont) { return 15	}
		if (collectionView == collectionViewColor) { return 15	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		if (collectionView == collectionViewFont) { return 15 	}
		if (collectionView == collectionViewColor) { return 15	}

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		if (collectionView == collectionViewFont) { return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) 	}
		if (collectionView == collectionViewColor) { return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)	}

		return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
	}
}

// MARK: - String
//-------------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension String {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.height)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
		return ceil(boundingBox.width)
	}
}
