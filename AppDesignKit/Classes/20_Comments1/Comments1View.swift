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
class Comments1View: UIViewController {

	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var tableView: UITableView!

	private var comments: [[String: Any]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "91 comments"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(actionAdd(_:)))

		tableView.register(UINib(nibName: "Comments1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Comments1Cell1")
		tableView.register(UINib(nibName: "Comments1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Comments1Cell2")

		updateUI()
		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
		refreshTableView()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		comments.removeAll()

		var data1: [[String: String]] = []
		let data2: [[String: String]] = []

		var dataDict1: [String: String] = [:]
		dataDict1["name"] = "Amy Roberts"
		dataDict1["count"] = "78"
		dataDict1["description"] = "The opening of that show had a familiar phrase that went, “Look. Up in the sky."
		dataDict1["date"] = "03 Mar 2020"
		data1.append(dataDict1)

		var dict1: [String: Any] = [:]
		dict1["name"] = "Betty Hansen"
		dict1["count"] = "77"
		dict1["description"] = "Of all of the celestial bodies that capture our attention and fascination as astronomers, none has a greater influence on life on planet Earth than it’s own satellite, the moon."
		dict1["date"] = "14 Mar 2020"
		dict1["subComments"] = data1
		comments.append(dict1)

		var dict2: [String: Any] = [:]
		dict2["name"] = "Chloe Adams"
		dict2["count"] = "54"
		dict2["description"] = "In the history of modern astronomy, there is probably no one greater leap forward"
		dict2["date"] = "19 Mar 2020"
		dict2["subComments"] = data2
		comments.append(dict2)

		var dict3: [String: Any] = [:]
		dict3["name"] = "Doris Royston"
		dict3["count"] = "65"
		dict3["description"] = "There is a lot of exciting stuff going on"
		dict3["date"] = "21 Mar 2020"
		dict3["subComments"] = data2
		comments.append(dict3)

		var dict4: [String: Any] = [:]
		dict4["name"] = "Emma Harris"
		dict4["count"] = "76"
		dict4["description"] = "Already study this site on awards its amazing works."
		dict4["date"] = "12 Mar 2020"
		dict4["subComments"] = data2
		comments.append(dict4)

		var dict5: [String: Any] = [:]
		dict5["name"] = "Fabia Smith"
		dict5["count"] = "85"
		dict5["description"] = "I thought you guys had made a VR experience for the website too "
		dict5["date"] = "09 Mar 2020"
		dict5["subComments"] = data2
		comments.append(dict5)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
		DispatchQueue.main.async {
			UIView.setAnimationsEnabled(false)
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			UIView.setAnimationsEnabled(true)
		}
	}

	// MARK: - Helper methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		let background = UIColor.systemBackground.image(segmentedControl.frame.size)
		let selected = AppColor.Theme.image(segmentedControl.frame.size)

		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
		segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : AppColor.Theme], for: .normal)
		segmentedControl.setBackgroundImage(background, for: .normal, barMetrics: .default)
		segmentedControl.setBackgroundImage(selected, for: .selected, barMetrics: .default)
		segmentedControl.setDividerImage(UIColor.systemBackground.image(), forLeftSegmentState: .normal, rightSegmentState: [.normal, .highlighted, .selected], barMetrics: .default)
		segmentedControl.layer.borderWidth = 1
		segmentedControl.layer.borderColor = AppColor.Theme.cgColor
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Comments1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return comments.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Comments1Cell1", for: indexPath) as! Comments1Cell1
		cell.bindData(index: indexPath.item, data: comments[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Comments1View: UITableViewDelegate {

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

// MARK: - UIColor
//-------------------------------------------------------------------------------------------------------------------------------------------------
fileprivate extension UIColor {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {

		return UIGraphicsImageRenderer(size: size).image { rendererContext in
			setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}
	}
}
