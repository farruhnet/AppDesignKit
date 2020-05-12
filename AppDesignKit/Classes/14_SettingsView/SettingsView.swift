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
class SettingsView: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var cellNightMode: UITableViewCell!
	@IBOutlet var cellOfflineReading: UITableViewCell!
	@IBOutlet var cellNotifications: UITableViewCell!

	@IBOutlet var cellEditProfile: UITableViewCell!
	@IBOutlet var cellSubscribe: UITableViewCell!

	@IBOutlet var cellReviewApp: UITableViewCell!
	@IBOutlet var cellHandsFree: UITableViewCell!
	@IBOutlet var cellClearCache: UITableViewCell!

	@IBOutlet var switchNightMode: UISwitch!
	@IBOutlet var labelCache: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Settings"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(actionDone(_:)))

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		switchNightMode.isOn = false
		labelCache.text = "39.4 MB"

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
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension SettingsView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 3
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return 3 }
		if (section == 1) { return 2 }
		if (section == 2) { return 3 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) && (indexPath.row == 0) { return cellNightMode		}
		if (indexPath.section == 0) && (indexPath.row == 1) { return cellOfflineReading	}
		if (indexPath.section == 0) && (indexPath.row == 2) { return cellNotifications	}

		if (indexPath.section == 1) && (indexPath.row == 0) { return cellEditProfile	}
		if (indexPath.section == 1) && (indexPath.row == 1) { return cellSubscribe		}

		if (indexPath.section == 2) && (indexPath.row == 0) { return cellReviewApp		}
		if (indexPath.section == 2) && (indexPath.row == 1) { return cellHandsFree		}
		if (indexPath.section == 2) && (indexPath.row == 2) { return cellClearCache		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension SettingsView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 45
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 25 }
		if (section == 1) { return 45 }
		if (section == 2) { return 45 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		if (section == 0) { return ""		 }
		if (section == 1) { return "ACCOUNT" }
		if (section == 2) { return "GENERAL" }

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

		dismiss(animated: true, completion: nil)
	}
}
