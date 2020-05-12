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
class Login1View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPassword: UITextField!
	@IBOutlet var buttonHideShowPassword: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()

		textFieldEmail.setLeftPadding(value: 15)
		textFieldPassword.setLeftPadding(value: 15)
		textFieldPassword.setRightPadding(value: 40)

		loadData()
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func loadData() {

		labelTitle.text = "Welcome to\nAppDesignKit"
		labelSubTitle.text = "Biggest collection of news, article & much more"
		imageViewLogo.image = UIImage(systemName: "circle.grid.hex.fill")
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionHideShowPassword(_ sender: Any) {

		buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
		textFieldPassword.isSecureTextEntry = !buttonHideShowPassword.isSelected
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionLogin(_ sender: Any) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionForgotPassword(_ sender: Any) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSignUp(_ sender: Any) {

		print(#function)
		dismiss(animated: true)
	}
}
