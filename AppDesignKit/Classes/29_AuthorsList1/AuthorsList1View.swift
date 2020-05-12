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
class AuthorsList1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var authors: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Authors"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justifyleft"), style: .plain, target: self, action: #selector(actionShort(_:)))

		tableView.register(UINib(nibName: "AuthorsList1Cell", bundle: Bundle.main), forCellReuseIdentifier: "AuthorsList1Cell")
		tableView.tableFooterView = UIView()

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		authors.removeAll()

		var dic1: [String: String] = [:]
		dic1["name"] = "Agatha Christie"
		dic1["books"] = "85"
		authors.append(dic1)

		var dic2: [String: String] = [:]
		dic2["name"] = "Akira Toriyama"
		dic2["books"] = "66"
		authors.append(dic2)

		var dic3: [String: String] = [:]
		dic3["name"] = "Alexander Pushkin"
		dic3["books"] = "17"
		authors.append(dic3)

		var dic4: [String: String] = [:]
		dic4["name"] = "Alistair MacLean"
		dic4["books"] = "32"
		authors.append(dic4)

		var dic5: [String: String] = [:]
		dic5["name"] = "Andrew Neiderman"
		dic5["books"] = "60"
		authors.append(dic5)

		var dic6: [String: String] = [:]
		dic6["name"] = "Ann M. Martin"
		dic6["books"] = "335"
		authors.append(dic6)

		var dic7: [String: String] = [:]
		dic7["name"] = "Anne Golon"
		dic7["books"] = "14"
		authors.append(dic7)

		var dic8: [String: String] = [:]
		dic8["name"] = "Anne Rice"
		dic8["books"] = "27"
		authors.append(dic8)

		var dic9: [String: String] = [:]
		dic9["name"] = "Arthur Hailey"
		dic9["books"] = "11"
		authors.append(dic9)

		var dic10: [String: String] = [:]
		dic10["name"] = "Astrid Lindgren"
		dic10["books"] = "100"
		authors.append(dic10)

		var dic11: [String: String] = [:]
		dic11["name"] = "Barbara Cartland"
		dic11["books"] = "723"
		authors.append(dic11)

		var dic12: [String: String] = [:]
		dic12["name"] = "Beatrix Potter"
		dic12["books"] = "23"
		authors.append(dic12)

		var dic13: [String: String] = [:]
		dic13["name"] = "C. S. Lewis"
		dic13["books"] = "38"
		authors.append(dic13)

		var dic14: [String: String] = [:]
		dic14["name"] = "Catherine Cookson"
		dic14["books"] = "103"
		authors.append(dic14)

		var dic15: [String: String] = [:]
		dic15["name"] = "Clive Cussler"
		dic15["books"] = "37"
		authors.append(dic15)

		var dic16: [String: String] = [:]
		dic16["name"] = "Corín Tellado"
		dic16["books"] = "4000"
		authors.append(dic16)

		var dic17: [String: String] = [:]
		dic17["name"] = "Dan Brown"
		dic17["books"] = "7"
		authors.append(dic17)

		var dic18: [String: String] = [:]
		dic18["name"] = "Danielle Steel"
		dic18["books"] = "179"
		authors.append(dic18)

		var dic19: [String: String] = [:]
		dic19["name"] = "David Baldacci"
		dic19["books"] = "25"
		authors.append(dic19)

		var dic20: [String: String] = [:]
		dic20["name"] = "Dean Koontz"
		dic20["books"] = "91"
		authors.append(dic20)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShort(_ sender: UIBarButtonItem) {

		print(#function)
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension AuthorsList1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return authors.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorsList1Cell", for: indexPath) as! AuthorsList1Cell
		cell.bindData(index: indexPath.item, data: authors[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension AuthorsList1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 70
	}
}
