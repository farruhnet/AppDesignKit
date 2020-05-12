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
class Comments1Cell1: UITableViewCell {

	@IBOutlet var imageUserProfile: UIImageView!
	@IBOutlet var labelUserName: UILabel!
	@IBOutlet var buttonMinus: UIButton!
	@IBOutlet var labelCount: UILabel!
	@IBOutlet var buttonPlus: UIButton!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var layoutConstraintDescriptionHeight: NSLayoutConstraint!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var buttonReplay: UIButton!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var viewSubComments: UIView!
	@IBOutlet var buttonUpArrow: UIButton!
	@IBOutlet var tableView: UITableView!
	@IBOutlet var layoutConstraintTableViewHeight: NSLayoutConstraint!
	@IBOutlet var buttonSeeAllReplay: UIButton!

	private var comments: [[String: String]] = []
	private var isSeeAllDisplay = false

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		buttonSeeAllReplay.layer.borderWidth = 1
		buttonSeeAllReplay.layer.borderColor = AppColor.Border.cgColor

		tableView.register(UINib(nibName: "Comments1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Comments1Cell2")
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: Any]) {

		guard let name = data["name"] as? String else { return }
		guard let count = data["count"] as? String else { return }
		guard let description = data["description"] as? String else { return }
		guard let date = data["date"] as? String else { return }
		guard let subComments = data["subComments"] as? [[String: String]] else { return }

		imageUserProfile.sample("Social", "Portraits", index)
		labelUserName.text = name
		labelCount.text = count
		labelDescription.text = description
		labelDate.text = date

		comments = subComments
		viewSubComments.isHidden = !(subComments.count > 0)

		if let descriptionHeight = labelDescription.text?.height(withConstrainedWidth: labelDescription.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
			layoutConstraintDescriptionHeight.constant = descriptionHeight
		}
		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.tableView.layoutIfNeeded()
			self.layoutConstraintTableViewHeight.constant = self.tableView.contentSize.height

			UIView.setAnimationsEnabled(false)
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			UIView.setAnimationsEnabled(true)
		}
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMinus(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPlus(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReplay(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionMore(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionUpArrow(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllReplay(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Comments1Cell1: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return (comments.count > 0) ? 1 : 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return isSeeAllDisplay ? comments.count : 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Comments1Cell2", for: indexPath) as! Comments1Cell2
		cell.bindData(index: indexPath.item, data: comments[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Comments1Cell1: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
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
