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
class Posts1Cell: UITableViewCell {

	@IBOutlet var imageUserProfile: UIImageView!
	@IBOutlet var labelUserName: UILabel!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelComments: UILabel!
	@IBOutlet var labelViews: UILabel!
	@IBOutlet var buttonMore: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let name = data["name"] else { return }
		guard let date = data["date"] else { return }
		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }
		guard let comments = data["comments"] else { return }
		guard let views = data["views"] else { return }

		imageUserProfile.sample("Reader", "News", index)
		labelUserName.text = name
		labelDate.text = date
		imageNews.sample("Reader", "News", index + 11)
		labelTitle.text = title
		labelDescription.text = description
		labelComments.text = comments
		labelViews.text = views
	}
}
