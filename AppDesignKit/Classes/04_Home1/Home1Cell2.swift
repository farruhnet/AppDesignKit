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
class Home1Cell2: UITableViewCell {

	@IBOutlet var imageNews: UIImageView!
	@IBOutlet var labelDate: UILabel!
	@IBOutlet var labelTitle: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let date = data["date"] else { return }
		guard let title = data["title"] else { return }

		imageNews.sample("Reader", "Politics", index + 13)
		labelDate.text = date
		labelTitle.text = title
	}
}
