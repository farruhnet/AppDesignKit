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
class EditProfileView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellProfile: UITableViewCell!
	@IBOutlet var cellName: UITableViewCell!
	@IBOutlet var cellUsername: UITableViewCell!
	@IBOutlet var cellWebsite: UITableViewCell!
	@IBOutlet var cellBio: UITableViewCell!

	@IBOutlet var cellEmail: UITableViewCell!
	@IBOutlet var cellPassword: UITableViewCell!
	@IBOutlet var cellPrivacySettings: UITableViewCell!
	@IBOutlet var cellDeleteAccount: UITableViewCell!

	@IBOutlet var imageProfile: UIImageView!
	@IBOutlet var buttonCamera: UIButton!

	@IBOutlet var textFieldName: UITextField!
	@IBOutlet var textFieldUsername: UITextField!
	@IBOutlet var textFieldWebsite: UITextField!
	@IBOutlet var textFieldBio: UITextField!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Edit Profile"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone(_:)))

		buttonCamera.layer.borderWidth = 1
		buttonCamera.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLayoutSubviews() {

		super.viewDidLayoutSubviews()
		imageProfile.layer.cornerRadius = imageProfile.frame.size.height/2
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageProfile.sample("Social", "Portraits", 10)
		textFieldName.text = "John Smith"
		textFieldUsername.text = "johnsmith"
		textFieldWebsite.text = "related.blog"
		textFieldBio.text = "UI/UX Designer at App Design Kit"

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDone(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCamera(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension EditProfileView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 5 }
		if (section == 1) { return 4 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellProfile	}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellName		}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellUsername	}
		if (indexPath.section == 0) && (indexPath.row == 3) { return cellWebsite	}
		if (indexPath.section == 0) && (indexPath.row == 4) { return cellBio		}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellEmail				}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellPassword			}
		if (indexPath.section == 1) && (indexPath.row == 2) { return cellPrivacySettings	}
		if (indexPath.section == 1) && (indexPath.row == 3) { return cellDeleteAccount		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension EditProfileView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) && (indexPath.row == 0) { return 120 }
		return 45
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 1 }
		if (section == 1) { return 45 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 1) { return "OTHER INFORMATION" }
		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

		if (section == 0) {
			if let header = view as? UITableViewHeaderFooterView {
				header.contentView.backgroundColor = .tertiarySystemFill
			}
		}

		if (section != 0) {
			if let header = view as? UITableViewHeaderFooterView {
				let viewY = header.frame.size.height - 0.5
				let view = UIView(frame: CGRect(x: 0, y: viewY, width: header.frame.size.width, height: 0.5))
				view.backgroundColor = .tertiarySystemFill
				view.tag = 1001
				header.contentView.subviews.forEach { (view) in
					if (view.tag == 1001) {
						view.removeFromSuperview()
					}
				}
				header.contentView.addSubview(view)
				header.textLabel?.font = UIFont.systemFont(ofSize: 12)
			}
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
