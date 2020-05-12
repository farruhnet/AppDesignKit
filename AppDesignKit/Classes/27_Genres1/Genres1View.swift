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
class Genres1View: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var genres: [[String: String]] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Genres"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		tableView.register(UINib(nibName: "Genres1Cell", bundle: Bundle.main), forCellReuseIdentifier: "Genres1Cell")

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		genres.removeAll()

		var dict1: [String: String] = [:]
		dict1["title"] = "Fantasy"
		dict1["description"] = "While usually set in a fictional imagined world—in opposition, Ta-Nehisi's Coates's The Water Dancer takes place in the very real world of American slavery—fantasy books include prominent elements of magic, mythology, or the supernatural"
		dict1["books"] = "421"
		genres.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Adventure"
		dict2["description"] = "Adventure books constantly have you on the edge of your seat with excitement, as your fave main character repeatedly finds themselves in high stakes situations"
		dict2["books"] = "1138"
		genres.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Romance"
		dict3["description"] = "Oh romance, how could we ever resist you? The genre that makes your heart all warm and fuzzy focuses on the love story of the main protagonists."
		dict3["books"] = "872"
		genres.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Biographies and Autobiographies"
		dict4["description"] = "Serving as an official account of the details and events of a person's life span, autobiographies are written by the subject themselves, while biographies are written by an author who is not the focus of the book."
		dict4["books"] = "124"
		genres.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Horror"
		dict5["description"] = "Meant to cause discomfort and fear for both the character and readers, horror writers often make use of supernatural and paranormal elements in morbid stories that are sometimes a little too realistic. The master of horror fiction? None other than Stephen King."
		dict5["books"] = "259"
		genres.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Thriller"
		dict6["description"] = "While they often encompass the same elements as mystery books, the suspense and thriller genre sees the hero attempt to stop and defeat the villain to save their own life rather than uncover a specific crime."
		dict6["books"] = "843"
		genres.append(dict6)

		var dict7: [String: String] = [:]
		dict7["title"] = "Self-Help"
		dict7["description"] = "Whether the focus is on emotional well-being, finances, or spirituality, self-help books center on encouraging personal improvement and confidence in a variety of facets of your life."
		dict7["books"] = "566"
		genres.append(dict7)

		var dict8: [String: String] = [:]
		dict8["title"] = "Science Fiction"
		dict8["description"] = "Though they're often thought of in the same vein as fantasy, what distinguishes science fiction stories is that they lean heavily on themes of technology and future science."
		dict8["books"] = "704"
		genres.append(dict8)

		var dict9: [String: String] = [:]
		dict9["title"] = "Historical fiction"
		dict9["description"] = "These books are based in a time period set in the past decades, often against the backdrop of significant (real) historical events."
		dict9["books"] = "657"
		genres.append(dict9)

		var dict10: [String: String] = [:]
		dict10["title"] = "Memoir"
		dict10["description"] = "While a form of autobiography, memoirs are more flexible in that they typically don't feature an extensive chronological account of the writer's life. Instead, they focus on key moments and scenes that communicate a specific message or lesson to the reader about the author."
		dict10["books"] = "1213"
		genres.append(dict10)

		refreshTableView()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshTableView() {

		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Genres1View: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return genres.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Genres1Cell", for: indexPath) as! Genres1Cell
		cell.bindData(index: indexPath.item, data: genres[indexPath.row])
		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Genres1View: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 140
	}
}
