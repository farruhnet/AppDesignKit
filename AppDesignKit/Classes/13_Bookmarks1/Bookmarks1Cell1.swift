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
class Bookmarks1Cell1: UITableViewCell {

	@IBOutlet var imageTopic: UIImageView!
	@IBOutlet var labelTopic1: UILabel!
	@IBOutlet var labelTopic2: UILabel!
	@IBOutlet var buttonMore: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let topic1 = data["topic1"] else { return }
		guard let topic2 = data["topic2"] else { return }

		imageTopic.sample("Reader", "Art", index + 2)
		labelTopic1.text = topic1
		labelTopic2.text = topic2
	}
}
