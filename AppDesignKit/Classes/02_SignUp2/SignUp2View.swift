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
class SignUp2View: UIViewController {

	@IBOutlet var imageViewProfile: UIButton!
	@IBOutlet var textFieldFullName: UITextField!
	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPassword: UITextField!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Sign Up"

		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(actionClose))

		textFieldFullName.setLeftPadding(value: 15)
		textFieldEmail.setLeftPadding(value: 15)
		textFieldPassword.setLeftPadding(value: 15)
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionClose() {

		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionImagePick(_ sender: Any) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCreateAccount(_ sender: Any) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionTerms(_ sender: Any) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionPrivacy(_ sender: Any) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionHaveAccount(_ sender: Any) {

		print(#function)
	}
}
