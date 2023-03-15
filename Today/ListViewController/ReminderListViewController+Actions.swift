//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Kübra Cennet Yavaşoğlu on 13.03.2023.
//

import UIKit

//Bir hatırlatıcı tanımlayıcısını saklayan özel bir düğme oluşturdunuz ve bir kullanıcı düğmeye dokunduğunda çağrılacak bir işlev tanımladınız. Ardından, düğmeyi işleve bağlamak için hedef eylem modelini kullanacaksınız.

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
    
 }
