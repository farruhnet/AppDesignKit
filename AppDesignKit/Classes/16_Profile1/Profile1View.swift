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
class Profile1View: UITableViewController {

	@IBOutlet var viewHeader: UIView!
	@IBOutlet var imageHeader: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubtitle: UILabel!

	private var news: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonAddList = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(actionAddList(_:)))
		let buttonMore = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		navigationItem.rightBarButtonItems = [buttonAddList, buttonMore]

		tableView.register(UINib(nibName: "Profile1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Profile1Cell")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageHeader.sample("Reader", "News", 18)
		labelTitle.text = "New York Times"
		labelSubtitle.text = "Breaking News & Top Stories"

		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Politics"
		dict1["date"] = "17 MAR 2020"
		dict1["title"] = "The 2020 Debate Over Health Care Is Getting ‘a Lot More Real’"
		dict1["comments"] = "322"
		dict1["views"] = "30.1k"
		news.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Business"
		dict2["date"] = "24 MAR 2020"
		dict2["title"] = "More Than 3 Million in U.S. Filed for Unemployment Last Week: Live Updates"
		dict2["comments"] = "910"
		dict2["views"] = "40.8k"
		news.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Opinion"
		dict3["date"] = "15 MAR 2020"
		dict3["title"] = "Trump Wants to ‘Reopen America.’ Here’s What Happens if We Do."
		dict3["comments"] = "468"
		dict3["views"] = "30.3k"
		news.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Tech"
		dict4["date"] = "14 MAR 2020"
		dict4["title"] = "Facebook Is ‘Just Trying to Keep the Lights On’ as Traffic Soars in Pandemic"
		dict4["comments"] = "139"
		dict4["views"] = "37.8k"
		news.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Science"
		dict5["date"] = "14 MAR 2020"
		dict5["title"] = "Life on the Planet Mercury? ‘It’s Not Completely Nuts’"
		dict5["comments"] = "778"
		dict5["views"] = "44.9k"
		news.append(dict5)

		var dict6: [String: String] = [:]
		dict6["category"] = "Health"
		dict6["date"] = "10 MAR 2020"
		dict6["title"] = "Amid Desperate Need for Ventilators, Calls Grow for Federal Intervention"
		dict6["comments"] = "907"
		dict6["views"] = "41.7k"
		news.append(dict6)

		var dict7: [String: String] = [:]
		dict7["category"] = "Sports"
		dict7["date"] = "19 MAR 2020"
		dict7["title"] = "A Year of ‘What If’ for the N.B.A."
		dict7["comments"] = "579"
		dict7["views"] = "19.5k"
		news.append(dict7)

		var dict8: [String: String] = [:]
		dict8["category"] = "Arts"
		dict8["date"] = "15 MAR 2020"
		dict8["title"] = "Online, the Show Goes On. But It’s Just Not the Same."
		dict8["comments"] = "364"
		dict8["views"] = "49.8k"
		news.append(dict8)

		var dict9: [String: String] = [:]
		dict9["category"] = "Books"
		dict9["date"] = "11 MAR 2020"
		dict9["title"] = "‘Threshold’ Resurrects the Angry, Ambitious Young Man"
		dict9["comments"] = "470"
		dict9["views"] = "13.5k"
		news.append(dict9)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()
		imageHeader.layer.cornerRadius = imageHeader.frame.size.height/2
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAddList(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return news.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Profile1Cell", for: indexPath) as! Profile1Cell
		cell.bindData(index: indexPath.item, data: news[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Profile1View {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 300
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 200
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		return viewHeader
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}
