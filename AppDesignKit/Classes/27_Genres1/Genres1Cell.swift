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
class Genres1Cell: UITableViewCell {

	@IBOutlet var imageGenres: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var labelBooks: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }
		guard let books = data["books"] else { return }

		imageGenres.sample("Reader", "Environment", index)
		labelTitle.text = title
		labelDescription.text = description
		labelBooks.text = books + " books"
	}
}
