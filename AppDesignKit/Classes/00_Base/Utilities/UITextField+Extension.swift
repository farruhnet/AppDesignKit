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
extension UITextField {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setLeftPadding(value: Int) {

		self.leftView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: value, height: value)))
		self.leftViewMode = .always
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func setRightPadding(value: Int) {

		self.rightView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: value, height: value)))
		self.rightViewMode = .always
	}
}
