//
//  AlertViewController.swift
//  Watcha
//
//  Created by 변상운 on 2020/10/31.
//  Copyright © 2020 sangun. All rights reserved.
//

import UIKit
import SnapKit
import UserNotifications

class AlertViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 타이틀
        self.navigationItem.title = "경고창, 팝업 띄우기"
    }
    
    // 제목만 있는 경고창
    @IBAction func presentAlert(_ sender: UIButton) {
        self.presentAlert(title: "제목만 있는 경고창")
    }
    
    // 제목과 본문이 있는 경고창
    @IBAction func presentAlertWithMessage(_ sender: UIButton) {
        self.presentAlert(title: "제목입니다", message: "본문 내용입니다")
    }
    
    // 취소가 있는 경고창
    @IBAction func presentAlertWithCancel(_ sender: UIButton) {
        self.presentAlert(title: "취소가 있는 경고창", isCancelActionIncluded: true)
    }
    
    // 확인에 completion이 있는 경고창
    @IBAction func presentAlertWithCompletion(_ sender: UIButton) {
        self.presentAlert(title: "completion이 있는 경고창", message: "확인 버튼을 누르면 배경 색깔이 노랑색으로 바뀝니다", isCancelActionIncluded: true) { action in
            self.view.backgroundColor = .yellow
        }
    }
    
    // 커스텀 UIAlertAction이 있는 경고창
    @IBAction func presentAlertWithAction(_ sender: UIButton) {
        let action = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        self.presentAlert(title: "커스텀 Action을 등록할 수 있습니다", isCancelActionIncluded: true, with: action)
    }
    
    // 커스텀 UIAlertAction들이 있는 경고창
    @IBAction func presentAlertWithActions(_ sender: UIButton) {
        let actionR = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionG = UIAlertAction(title: "배경 색상을 초록색으로 변경", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionB = UIAlertAction(title: "배경 색상을 파란색으로 변경", style: .default) { action in
            self.view.backgroundColor = .blue
        }
        let cancelAction = UIAlertAction(title: "원래대로 돌리기", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            title: "커스텀 Action을 등록할 수 있습니다",
            with: actionR, actionG, actionB, cancelAction
        )
    }
    
    // 커스텀 UIAlertAction들이 있는 Action Sheet
    @IBAction func presentActionSheetWithActions(_ sender: UIButton) {
        let actionR = UIAlertAction(title: "배경 색상을 빨간색으로 변경", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionG = UIAlertAction(title: "배경 색상을 초록색으로 변경", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionB = UIAlertAction(title: "배경 색상을 파란색으로 변경", style: .default) { action in
            self.view.backgroundColor = .blue
        }
        let cancelAction = UIAlertAction(title: "원래대로 돌리기", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            title: "커스텀 Action을 등록할 수 있습니다",
            preferredStyle: .actionSheet,
            with: actionR, actionG, actionB, cancelAction
        )
    }
    
    // 커스텀 하단 경고창
    @IBAction func presentBottomAlert(_ sender: UIButton) {
        self.presentBottomAlert(message: "하단 경고창입니다")
    }
}
