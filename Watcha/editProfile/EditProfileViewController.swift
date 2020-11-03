//
//  EditProfileViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/11/03.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit

class EditProfileViewController: BaseViewController, UITextViewDelegate  {

    
    @IBOutlet weak var editUserNameTextView: UITextView!
    
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    let defaultUser: UIImage = UIImage(named: "defaultUser")!
    var userNameSent = ""
    var userName = ""
    var validationCheck = false
    
    @IBAction func editCancelButtonTapped(_ sender: UIButton) {
        self.dismissKeyboard()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editCompleteButtonTapped(_ sender: UIButton) {
        
        if(validationCheck == false){
            editUserNameTextView.layer.borderColor = UIColor.red.cgColor
            alertLabel.textColor = UIColor.red
        }
        else {
            // api 호출하여 바뀐 이름 전달
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editUserNameTextView.delegate = self
        editUserNameTextView.backgroundColor = #colorLiteral(red: 0.1048631147, green: 0.1042473093, blue: 0.1053413227, alpha: 1)
        editUserNameTextView.layer.borderWidth = 1.0
        editUserNameTextView.layer.borderColor = UIColor.darkGray.cgColor
        editUserNameTextView.textColor = .mainWhite
        editUserNameTextView.centerVertically()
        
        userName = userNameSent
        profileImage.image = defaultUser
        profileImage.layer.cornerRadius = 50
        
        editUserNameTextView.text = userName
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = editUserNameTextView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
     
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
     
        print(changedText.count)
        if(changedText.count < 2){
            validationCheck = false
        }
        else {
            validationCheck = true
        }
        
        return changedText.count <= 16
    }
    
    
    
    
}

extension UITextView{
    // TextView 텍스트 세로 가운데 정렬
    func centerVertically() {
           let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
           let size = sizeThatFits(fittingSize)
           let topOffset = (bounds.size.height - size.height * zoomScale) / 2
           let positiveTopOffset = max(1, topOffset)
           contentOffset.y = -positiveTopOffset
    }
}
