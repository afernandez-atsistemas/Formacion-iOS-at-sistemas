//
//  NotificationsProvider.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 4/3/21.
//

import Foundation
import UserNotifications
import PromiseKit

// Nuestro provider que ocultará los detalles de implementación de Apple
// (en la medida de lo posible)
protocol NotificationsProviderContract {
    func areNotificationsEnabled() -> Promise<Bool>
    func requestAuthorizationForNotifications() -> Promise<Bool>
    func registerDeviceForNotifications()
    func receiveDeviceToken(data: Data)
}

// Una forma para que el provider nos comunique cuando le ha llegado una notificación
protocol NotificationsProviderOutputContract {
    func receiveNotificationWithAction(action: String)
}

class NotificationsProvider: NSObject, NotificationsProviderContract {
    let unCenter = UNUserNotificationCenter.current()
    var output: NotificationsProviderOutputContract!

    init(outputNotifications: NotificationsProviderOutputContract) {
        super.init()
        output = outputNotifications
        unCenter.delegate = self
    }
    
    func areNotificationsEnabled() -> Promise<Bool> {
        return Promise<Bool> { promise in
            unCenter.getNotificationSettings { settings in
                switch settings.authorizationStatus {
                case .notDetermined:
                    promise.fulfill(false)
                case .authorized:
                    promise.fulfill(true)
                case .denied:
                    promise.fulfill(false)
                case .ephemeral:
                    promise.fulfill(true)
                case .provisional:
                    promise.fulfill(false)
                @unknown default:
                    promise.fulfill(false)
                }
            }
        }
    }

    func requestAuthorizationForNotifications() -> Promise<Bool> {
        return Promise<Bool> { promise in
            unCenter.requestAuthorization(options: [.badge, .alert, .sound]) { success, error in
                if let error = error {
                    promise.reject(error)
                } else {
                    promise.fulfill(success)
                }
            }
        }
    }

    func registerDeviceForNotifications() {
        UIApplication.shared.registerForRemoteNotifications()
    }

    func receiveDeviceToken(data: Data) {
        assert(false, "NOT IMPLEMENTED")
    }
}

extension NotificationsProvider: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        output.receiveNotificationWithAction(action: "Notification in Background")
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        output.receiveNotificationWithAction(action: "Notification in Foreground")
        completionHandler(.banner)
    }
}

class ActionsHandler: NotificationsProviderOutputContract {
    func receiveNotificationWithAction(action: String) {
        debugPrint("Gt notifixation hit with action: \(action)")
    }
}
