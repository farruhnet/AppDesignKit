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
class Home1Cell1: UICollectionViewCell {

	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelAuthor: UILabel!
	@IBOutlet var buttonMore: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		buttonMore.layer.borderWidth = 1
		buttonMore.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let date = data["date"] else { return }
		guard let title = data["title"] else { return }
		guard let author = data["author"] else { return }

		imageNews.sample("Reader", "Politics", index + 9)
		labelDate.text = date
		labelTitle.text = title
		labelAuthor.text = author
	}
}
