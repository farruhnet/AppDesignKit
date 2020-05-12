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
class Books1View: UIViewController {

	@IBOutlet var segmentedControl: UISegmentedControl!
	@IBOutlet var tableView: UITableView!

	private var books: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Classics"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonMenu = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		navigationItem.rightBarButtonItem = buttonMenu

		tableView.register(UINib(nibName: "Books1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Books1Cell")

		updateUI()
		loadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		updateUI()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		books.removeAll()

		var dict1: [String: String] = [:]
		dict1["name"] = "The 7 Habits of Highly Effective People"
		dict1["author"] = "Stephen Covey"
		dict1["date"] = "Mar 17, 2020"
		dict1["rating"] = "4.7"
		dict1["review"] = "811"
		books.append(dict1)

		var dict2: [String: String] = [:]
		dict2["name"] = "Something I Never Told You"
		dict2["author"] = "Shravya Bhinder"
		dict2["date"] = "Mar 24, 2020"
		dict2["rating"] = "4.0"
		dict2["review"] = "894"
		books.append(dict2)

		var dict3: [String: String] = [:]
		dict3["name"] = "This is Not Your Story"
		dict3["author"] = "Savi Sharma"
		dict3["date"] = "Mar 15, 2020"
		dict3["rating"] = "3.5"
		dict3["review"] = "11.2k"
		books.append(dict3)

		var dict4: [String: String] = [:]
		dict4["name"] = "How to Win Friends and Influence People"
		dict4["author"] = "Dale Carnegie"
		dict4["date"] = "Mar 14, 2020"
		dict4["rating"] = "1.8"
		dict4["review"] = "682"
		books.append(dict4)

		var dict5: [String: String] = [:]
		dict5["name"] = "Dear Stranger, I Know How You Feel"
		dict5["author"] = "Ashish Bagrecha"
		dict5["date"] = "Mar 14, 2020"
		dict5["rating"] = "2.4"
		dict5["review"] = "258"
		books.append(dict5)

		var dict6: [String: String] = [:]
		dict6["name"] = "Who Moved My Cheese?"
		dict6["author"] = "Spencer Johnson"
		dict6["date"] = "Mar 10, 2020"
		dict6["rating"] = "4.9"
		dict6["review"] = "331"
		books.append(dict6)

		var dict7: [String: String] = [:]
		dict7["name"] = "The Magic of Thinking Big"
		dict7["author"] = "David J. Schwartz"
		dict7["date"] = "Mar 19, 2020"
		dict7["rating"] = "3.9"
		dict7["review"] = "19.5k"
		books.append(dict7)

		var dict8: [String: String] = [:]
		dict8["name"] = "Think & Grow Rich"
		dict8["author"] = "Napolean Hill"
		dict8["date"] = "Mar 15, 2020"
		dict8["rating"] = "5.0"
		dict8["review"] = "276"
		books.append(dict8)

		var dict9: [String: String] = [:]
		dict9["name"] = "The Power of Positive Thinking"
		dict9["author"] = "Norman Vincent Peale"
		dict9["date"] = "Mar 11, 2020"
		dict9["rating"] = "2.0"
		dict9["review"] = "214"
		books.append(dict9)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
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
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSegmentChange(_ sender: UISegmentedControl) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd(_ sender: UIButton) {

		print(#function)
		sender.isSelected = !sender.isSelected
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Books1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return books.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Books1Cell", for: indexPath) as! Books1Cell
		cell.bindData(index: indexPath.item, data: books[indexPath.row])
		cell.buttonAdd.addTarget(self, action: #selector(actionAdd(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Books1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 120
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
