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
class Comments1Cell2: UITableViewCell {

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

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let count = data["count"] else { return }
		guard let description = data["description"] else { return }
		guard let date = data["date"] else { return }

		imageUserProfile.sample("Social", "Portraits", index + 12)
		labelUserName.text = name
		labelCount.text = count
		labelDescription.text = description
		labelDate.text = date

		DispatchQueue.main.async {
			if let descriptionHeight = self.labelDescription.text?.height(withConstrainedWidth: self.labelDescription.frame.size.width, font: UIFont.systemFont(ofSize: 16)) {
				self.layoutConstraintDescriptionHeight.constant = descriptionHeight
			}
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
