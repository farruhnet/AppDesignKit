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
class Book1View: UIViewController {

	@IBOutlet var imageBooks: UIImageView!
	@IBOutlet var labelAuthor: UILabel!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var labelRating: UILabel!
	@IBOutlet var labelReview: UILabel!
	@IBOutlet var labelDescription: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		let buttonShare = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(actionShare(_:)))
		navigationItem.rightBarButtonItem = buttonShare

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		imageBooks.sample("Reader", "Art", 10)
		labelAuthor.text = "David J. Schwartz"
		labelName.text = "The Magic of Thinking Big"
		labelDate.text = "Mar 19, 1959 - 228 Pages"
		labelRating.text = "4.9"
		labelReview.text = "19.5k reviews"
		labelDescription.text = """
		DR DAVID J SCHWARTZ was a world-renowned motivational speaker and personal development expert. Born in the United States in 1927, he went on to be a professor at Georgia State University, and later founded his own consultancy firm, Creative Educational Services Inc.

		CES Inc. specialised in leadership development and life strategy, subjects which Swchartz went on to write several highly-acclaimed books about. He passed away in 1987.
		"""
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionShare(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddLibrary(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionReviews(_ sender: UIButton) {

		print(#function)
	}
}
