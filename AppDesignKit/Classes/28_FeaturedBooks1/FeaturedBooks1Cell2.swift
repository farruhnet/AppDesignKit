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
class FeaturedBooks1Cell2: UICollectionViewCell {

	@IBOutlet var imageBookCover: UIImageView!
	@IBOutlet var labelName: UILabel!
	@IBOutlet var labelAuthor: UILabel!
	@IBOutlet var buttonAdd: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonAdd.layer.borderWidth = 1
		buttonAdd.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let author = data["author"] else { return }

		imageBookCover.sample("Reader", "Environment", index + 18)
		labelName.text = name
		labelAuthor.text = author
	}
}
