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
class Bookmarks1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	@IBOutlet var viewTopics: UIView!
	@IBOutlet var viewFooter: UIView!
	@IBOutlet var viewArticles: UIView!

	private var topics: [[String: String]] = []
	private var articles: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.isHidden = true

		tableView.register(UINib(nibName: "Bookmarks1Cell1", bundle: Bundle.main), forCellReuseIdentifier: "Bookmarks1Cell1")
		tableView.register(UINib(nibName: "Bookmarks1Cell2", bundle: Bundle.main), forCellReuseIdentifier: "Bookmarks1Cell2")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		topics.removeAll()
		articles.removeAll()

		var dict1: [String: String] = [:]
		dict1["topic1"] = "Politics"
		dict1["topic2"] = "737 reading about this"
		topics.append(dict1)

		var dict2: [String: String] = [:]
		dict2["topic1"] = "Business"
		dict2["topic2"] = "561 reading about this"
		topics.append(dict2)

		var dict3: [String: String] = [:]
		dict3["topic1"] = "Opinion"
		dict3["topic2"] = "906 reading about this"
		topics.append(dict3)

		var dict4: [String: String] = [:]
		dict4["topic1"] = "Tech"
		dict4["topic2"] = "439 reading about this"
		topics.append(dict4)

		var dict5: [String: String] = [:]
		dict5["topic1"] = "Science"
		dict5["topic2"] = "557 reading about this"
		topics.append(dict5)

		var dict6: [String: String] = [:]
		dict6["topic1"] = "Health"
		dict6["topic2"] = "547 reading about this"
		topics.append(dict6)

		var dict7: [String: String] = [:]
		dict7["date"] = "08 MAR 2020"
		dict7["title"] = "In a world consumer by fear, marble racing proves welcome distraction"
		dict7["author"] = "Fox News"
		articles.append(dict7)

		var dict8: [String: String] = [:]
		dict8["date"] = "10 MAR 2020"
		dict8["title"] = "Instacart plans to hire 300,000 more workers as demand surges for grocery deliveries"
		dict8["author"] = "Fortune"
		articles.append(dict8)

		var dict9: [String: String] = [:]
		dict9["date"] = "04 MAR 2020"
		dict9["title"] = "We’re in Disaster Mode’: Courage Inside a Brooklyn Hospital"
		dict9["author"] = "The New Yorker"
		articles.append(dict9)

		var dict10: [String: String] = [:]
		dict10["date"] = "20 MAR 2020"
		dict10["title"] = "Europe’s Leaders Ditch Austerity and Fight Pandemic With Cash"
		dict10["author"] = "Us Weekly"
		articles.append(dict10)

		var dict11: [String: String] = [:]
		dict11["date"] = "08 MAR 2020"
		dict11["title"] = "What Made New York So Hospitable for Coronavirus?"
		dict11["author"] = "Fox News"
		articles.append(dict11)

		var dict12: [String: String] = [:]
		dict12["date"] = "20 MAR 2020"
		dict12["title"] = "Last known survivor of transatlantic slave trade identified"
		dict12["author"] = "BBC News"
		articles.append(dict12)

		var dict13: [String: String] = [:]
		dict13["date"] = "19 MAR 2020"
		dict13["title"] = "White House coordinator: My grandmother had to live with this for 88 years"
		dict13["author"] = "The Atlantic"
		articles.append(dict13)

		var dict14: [String: String] = [:]
		dict14["date"] = "09 MAR 2020"
		dict14["title"] = "Idris Elba hits back at claims he is lying about coronavirus"
		dict14["author"] = "Washington Examiner"
		articles.append(dict14)

		var dict15: [String: String] = [:]
		dict15["date"] = "12 MAR 2020"
		dict15["title"] = "Questions arise after teen's death was initially linked to coronavirus in California"
		dict15["author"] = "Us Weekly"
		articles.append(dict15)

		var dict16: [String: String] = [:]
		dict16["date"] = "09 MAR 2020"
		dict16["title"] = "Video reveals lung damage in US coronavirus patient: 'People need to take this seriously'"
		dict16["author"] = "New York Times"
		articles.append(dict16)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddTopics(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllTopic(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddArticles(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true, completion: nil)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Bookmarks1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 2
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if (section == 0) { return topics.count }
		if (section == 1) { return articles.count }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if (indexPath.section == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Bookmarks1Cell1", for: indexPath) as! Bookmarks1Cell1
			cell.bindData(index: indexPath.item, data: topics[indexPath.row])
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			return cell
		}

		if (indexPath.section == 1) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Bookmarks1Cell2", for: indexPath) as! Bookmarks1Cell2
			cell.bindData(index: indexPath.item, data: articles[indexPath.row])
			cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
			return cell
		}

		return UITableViewCell()
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Bookmarks1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		if (section == 0) { return 60 }
		if (section == 1) { return 60 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		if (section == 0) { return 40 }
		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		if (section == 0) { return viewTopics	}
		if (section == 1) { return viewArticles	}
		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

		if (section == 0) { return viewFooter }
		return nil
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		if (indexPath.section == 0) { return 70		}
		if (indexPath.section == 1) { return 120	}
		return 0
	}
}
