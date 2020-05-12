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
class NavigationController: UINavigationController {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		setNavigationBar()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override var preferredStatusBarStyle: UIStatusBarStyle {

		return .default
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setNavigationBar() {

		let compactAppearance = UINavigationBarAppearance()
		compactAppearance.configureWithTransparentBackground()
		compactAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
		compactAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
		compactAppearance.backgroundColor = .systemBackground

		navigationBar.isTranslucent = true
		navigationBar.standardAppearance = compactAppearance
		navigationBar.compactAppearance = compactAppearance
		navigationBar.scrollEdgeAppearance = compactAppearance
		navigationBar.tintColor = AppColor.Theme
		navigationBar.layoutIfNeeded()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setBackground(color: UIColor) {

		self.navigationBar.standardAppearance.backgroundColor = color
		self.navigationBar.compactAppearance?.backgroundColor = color
		self.navigationBar.scrollEdgeAppearance?.backgroundColor = color
	}
}
