import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGoogleSignInButton()
    }

    private func setupGoogleSignInButton() {
        let signInButton = GIDSignInButton() // Google Sign-In Button
        signInButton.backgroundColor = UIColor.black
        signInButton.center = view.center
        signInButton.addTarget(self, action: #selector(handleSignInButtonTap), for: .touchUpInside)
        view.addSubview(signInButton)
    }

    @objc func handleSignInButtonTap() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            print("Firebase client ID not found.")
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            if let error = error {
                print("Google Sign-In error: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("Google Sign-In failed to retrieve user or token.")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in error: \(error.localizedDescription)")
                    return
                }
                performSegue(withIdentifier: "sign", sender: nil)
                print("User signed in successfully: \(authResult?.user.displayName ?? "Unknown")")
            }
        }
    }
}

