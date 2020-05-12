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
class Top1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var news: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Popular"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always

		tableView.register(UINib(nibName: "Top1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Top1Cell")
		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		news.removeAll()

		var dict1: [String: String] = [:]
		dict1["category"] = "Politics"
		dict1["title"] = "The 2020 Debate Over Health Care Is Getting ‘a Lot More Real’"
		dict1["views"] = "11.3k"
		dict1["comments"] = "804"
		news.append(dict1)

		var dict2: [String: String] = [:]
		dict2["category"] = "Business"
		dict2["title"] = "More Than 3 Million in U.S. Filed for Unemployment Last Week: Live Updates"
		dict2["views"] = "15.9k"
		dict2["comments"] = "764"
		news.append(dict2)

		var dict3: [String: String] = [:]
		dict3["category"] = "Opinion"
		dict3["title"] = "Trump Wants to ‘Reopen America.’ Here’s What Happens if We Do."
		dict3["views"] = "27.4k"
		dict3["comments"] = "192"
		news.append(dict3)

		var dict4: [String: String] = [:]
		dict4["category"] = "Tech"
		dict4["title"] = "Facebook Is ‘Just Trying to Keep the Lights On’ as Traffic Soars in Pandemic"
		dict4["views"] = "21.9k"
		dict4["comments"] = "484"
		news.append(dict4)

		var dict5: [String: String] = [:]
		dict5["category"] = "Science"
		dict5["title"] = "Life on the Planet Mercury? ‘It’s Not Completely Nuts’"
		dict5["views"] = "20k"
		dict5["comments"] = "486"
		news.append(dict5)

		var dict6: [String: String] = [:]
		dict6["category"] = "Health"
		dict6["title"] = "What Made New York So Hospitable for Coronavirus?'"
		dict6["views"] = "2k"
		dict6["comments"] = "653"
		news.append(dict6)

		var dict7: [String: String] = [:]
		dict7["category"] = "Sports"
		dict7["title"] = "It’s Opening Day. Baseball Is Closed."
		dict7["views"] = "49k"
		dict7["comments"] = "274"
		news.append(dict7)

		var dict8: [String: String] = [:]
		dict8["category"] = "Arts"
		dict8["title"] = "The Merry-Go-Round Stopped. What Sort of Art Will Emerge?"
		dict8["views"] = "9.8k"
		dict8["comments"] = "332"
		news.append(dict8)

		var dict9: [String: String] = [:]
		dict9["category"] = "Books"
		dict9["title"] = "With Kids Learning From Home, Children’s Publishers See a Spike"
		dict9["views"] = "10k"
		dict9["comments"] = "354"
		news.append(dict9)

		var dict10: [String: String] = [:]
		dict10["category"] = "Style"
		dict10["title"] = "You Are Your Safest Sex Partner. Betty Dodson Wants to Help."
		dict10["views"] = "36k"
		dict10["comments"] = "151"
		news.append(dict10)

		var dict11: [String: String] = [:]
		dict11["category"] = "Food"
		dict11["title"] = "Food Supply Anxiety Brings Back Victory Gardens"
		dict11["views"] = "46k"
		dict11["comments"] = "781"
		news.append(dict11)

		var dict12: [String: String] = [:]
		dict12["category"] = "Travel"
		dict12["title"] = "Airlines’ New Operating Mode: Flexible"
		dict12["views"] = "2k"
		dict12["comments"] = "278"
		news.append(dict12)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMore(_ sender: UIButton) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Top1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return news.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Top1Cell", for: indexPath) as! Top1Cell
		cell.labelIndex.text = "#" + String(indexPath.row+1)
		cell.bindData(data: news[indexPath.row])
		cell.buttonMore.addTarget(self, action: #selector(actionMore(_:)), for: .touchUpInside)
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Top1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 110
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}
}

