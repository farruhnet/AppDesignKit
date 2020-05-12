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
class BaseView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var names: [String] = []

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "List of Views"

		navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

		tableView.tableFooterView = UIView()

		names.append("Login1View")
		names.append("SignUp2View")
		names.append("Walkthrough4View")
		names.append("Home1View")
		names.append("Top1View")
		names.append("Categories1View")
		names.append("Posts1View")
		names.append("Posts3View")
		names.append("Posts8View")
		names.append("Topics1View")
		names.append("Notifications1View")
		names.append("Search1View")
		names.append("Bookmarks1View")
		names.append("SettingsView")
		names.append("EditProfileView")
		names.append("Profile1View")
		names.append("Article1View")
		names.append("TextOptions1View")
		names.append("TextEditView")
		names.append("Comments1View")
		names.append("AddComment1View")
		names.append("BookPageView")
		names.append("Books1View")
		names.append("Book1View")
		names.append("MyLibrary1View")
		names.append("CollectionsView")
		names.append("Genres1View")
		names.append("FeaturedBooks1View")
		names.append("AuthorsList1View")
		names.append("Author1View")
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return names.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .default, reuseIdentifier: "cell") }

		cell.textLabel?.text = "\(indexPath.row+1). " + names[indexPath.row]

		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension BaseView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		switch names[indexPath.row] {

			case "Login1View":
				let login1View = Login1View()
				login1View.isModalInPresentation = true
				login1View.modalPresentationStyle = .fullScreen
				present(login1View, animated: true)

			case "SignUp2View":
				let signUp2View = SignUp2View()
				let navigation = NavigationController(rootViewController: signUp2View)
				navigation.isModalInPresentation = true
				navigation.navigationBar.isTranslucent = false
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Walkthrough4View":
				let walkthrough4View = Walkthrough4View()
				let navigation = NavigationController(rootViewController: walkthrough4View)
				navigation.isModalInPresentation = true
				navigation.modalPresentationStyle = .fullScreen
				present(navigation, animated: true)

			case "Home1View":
				let home1View = Home1View()
				home1View.modalPresentationStyle = .fullScreen
				present(home1View, animated: true)

			case "Top1View":
				let top1View = Top1View()
				navigationController?.pushViewController(top1View, animated: true)

			case "Categories1View":
				let categories1View = Categories1View()
				let navController = NavigationController(rootViewController: categories1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Posts1View":
				let posts1View = Posts1View()
				navigationController?.pushViewController(posts1View, animated: true)

			case "Posts3View":
				let posts3View = Posts3View()
				navigationController?.pushViewController(posts3View, animated: true)

			case "Posts8View":
				let posts8View = Posts8View()
				posts8View.modalPresentationStyle = .fullScreen
				present(posts8View, animated: true)

			case "Topics1View":
				let topics1View = Topics1View()
				let navController = NavigationController(rootViewController: topics1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Notifications1View":
				let notifications1View = Notifications1View()
				present(notifications1View, animated: true)

			case "Search1View":
				let search1View = Search1View()
				let navController = NavigationController(rootViewController: search1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Bookmarks1View":
				let bookmarks1View = Bookmarks1View()
				bookmarks1View.modalPresentationStyle = .fullScreen
				present(bookmarks1View, animated: true)

			case "SettingsView":
				let settingsView = SettingsView()
				let navController = NavigationController(rootViewController: settingsView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "EditProfileView":
				let editProfileView = EditProfileView()
				let navController = NavigationController(rootViewController: editProfileView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Profile1View":
				let profile1View = Profile1View()
				navigationController?.pushViewController(profile1View, animated: true)

			case "Article1View":
				let article1View = Article1View()
				navigationController?.pushViewController(article1View, animated: true)

			case "TextOptions1View":
				let textOptions1View = TextOptions1View()
				navigationController?.pushViewController(textOptions1View, animated: true)

			case "TextEditView":
				let textEditView = TextEditView()
				let navController = NavigationController(rootViewController: textEditView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Comments1View":
				let comments1View = Comments1View()
				navigationController?.pushViewController(comments1View, animated: true)

			case "AddComment1View":
				let addComment1View = AddComment1View()
				present(addComment1View, animated: true)

			case "BookPageView":
				let bookPageView = BookPageView()
				let navController = NavigationController(rootViewController: bookPageView)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "Books1View":
				let books1View = Books1View()
				navigationController?.pushViewController(books1View, animated: true)

			case "Book1View":
				let book1View = Book1View()
				navigationController?.pushViewController(book1View, animated: true)

			case "MyLibrary1View":
				let myLibrary1View = MyLibrary1View()
				let navController = NavigationController(rootViewController: myLibrary1View)
				navController.modalPresentationStyle = .fullScreen
				present(navController, animated: true)

			case "CollectionsView":
				let collectionsView = CollectionsView()
				present(collectionsView, animated: true)

			case "Genres1View":
				let genres1View = Genres1View()
				navigationController?.pushViewController(genres1View, animated: true)

			case "FeaturedBooks1View":
				let featuredBooks1View = FeaturedBooks1View()
				featuredBooks1View.modalPresentationStyle = .fullScreen
				present(featuredBooks1View, animated: true)

			case "AuthorsList1View":
				let authorsList1View = AuthorsList1View()
				navigationController?.pushViewController(authorsList1View, animated: true)

			case "Author1View":
				let author1View = Author1View()
				navigationController?.pushViewController(author1View, animated: true)

			default:
				break
		}
	}
}
