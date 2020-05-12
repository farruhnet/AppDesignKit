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
import IQKeyboardManagerSwift

//-------------------------------------------------------------------------------------------------------------------------------------------------
class AddComment1View: UIViewController {

	@IBOutlet var layoutConstraintBottom: NSLayoutConstraint!

	@IBOutlet var textViewWriteComment: UITextView!

	private var placeholderLabel = UILabel()

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
		IQKeyboardManager.shared.enable = false

		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self)
		IQKeyboardManager.shared.enable = true
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		placeholderLabel.text = "Write a comment…"
		placeholderLabel.font = UIFont.systemFont(ofSize: (textViewWriteComment.font?.pointSize)!)
		placeholderLabel.sizeToFit()
		placeholderLabel.frame.origin = CGPoint(x: 5, y: (textViewWriteComment.font?.pointSize)! / 2)
		placeholderLabel.textColor = UIColor.label
		placeholderLabel.isHidden = !textViewWriteComment.text.isEmpty
		textViewWriteComment.addSubview(placeholderLabel)
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillShow(_ notification: Notification) {

		if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardRectangle = keyboardFrame.cgRectValue
			let keyboardHeight = keyboardRectangle.height
			print(keyboardHeight)
			UIView.animate(withDuration: 0.5) {
				self.layoutConstraintBottom.constant = -keyboardHeight
			}
			UIView.animate(withDuration: 0.5, animations: {
				self.layoutConstraintBottom.constant = -keyboardHeight
			}) { (isComplete) in
				self.layoutConstraintBottom.constant += self.view.safeAreaInsets.bottom
			}
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func keyboardWillHide(_ notification: Notification) {

		UIView.animate(withDuration: 0.5) {
			self.layoutConstraintBottom.constant = 0
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCancel(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPost(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension AddComment1View: UITextViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func textViewDidChange(_ textView: UITextView) {

		placeholderLabel.isHidden = !textViewWriteComment.text.isEmpty
	}
}
