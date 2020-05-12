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
class BookPageView: UIViewController {

	@IBOutlet var labelContent: UILabel!
	@IBOutlet var progressView: UIProgressView!
	@IBOutlet var labelChapter: UILabel!
	@IBOutlet var labelPageIndicator: UILabel!
	@IBOutlet var buttonNextChapter: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "A Brief History of Time"
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonClose = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(actionClose(_:)))
		let buttonMenu = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(actionMenu(_:)))
		let buttonBookmark = UIBarButtonItem(image: UIImage(systemName: "bookmark.fill"), style: .plain, target: self, action: #selector(actionBookmark(_:)))
		let buttonSettings = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: #selector(actionSettings(_:)))

		navigationItem.leftBarButtonItems = [buttonClose, buttonMenu]
		navigationItem.rightBarButtonItems = [buttonSettings, buttonBookmark]

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		progressView.progress = 0.5
		labelChapter.text = "Chapter 1"
		labelPageIndicator.text = "7 of 41"
		labelContent.text = """
		There is probably no one greater leap forward than the building and launch of the space telescope known as the Hubble. While NASA has had many ups and downs, the launch and continued operation of the Hubble space telescope probably ranks next to the moon landings and the development of the Space Shuttle as one of the greatest space exploration accomplishments of the last hundred years.

		An amazing piece of astronomy trivia that few people know is that in truth, only about ten percent of the universe is visible using conventional methods of observation. For that reason, the Hubble really was a huge leap forward. That is for the very simple reason that the Hubble can operate outside of the atmosphere of Earth.

		Trying to make significant space exploration via telescopes from the terrestrial surface of planet Earth is very difficult. That very thing that keeps us alive, our own.
		"""
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionMenu(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionBookmark(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionSettings(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionNextChapter(_ sender: UIButton) {

		print(#function)
	}
}
