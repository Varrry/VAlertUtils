//
//  UIViewController+Alert.swift
//
//  Created by Vitaly Trofimov on 30/01/2019.
//  Copyright © 2019 v. All rights reserved.
//

import UIKit




extension UIViewController
{
	func alert(
		title: String? = nil,
		_ message: String?,
		actions: [UIAlertAction] = [okAlertAction()]
		)
	{
		let alertController = UIAlertController(
			title: title,
			message: message,
			preferredStyle: .alert
		)
		actions.forEach { alertController.addAction($0) }
		present(
			alertController,
			animated: true
		)
	}
	
	private static let defaultOkTitle = "OK"
	
	typealias OnAlertDismiss = () -> Void
	
	static func okAlertAction(
		title: String = defaultOkTitle,
		onDismiss: OnAlertDismiss? = nil
		) -> UIAlertAction
	{
		return UIAlertAction(
			title: title,
			style: .default,
			handler: { _ in
				onDismiss?()
			}
		)
	}
}



// MARK: - Errors

extension UIViewController
{
	func alertError(
		title: String? = nil,
		_ error: Error,
		okTitle: String = defaultOkTitle,
		onDismiss: OnAlertDismiss? = nil
		)
	{
		alertErrorMessage(
			title: title,
			error.localizedDescription,
			okTitle: okTitle,
			onDismiss: onDismiss
		)
	}
	
	func alertErrorMessage(
		title: String? = nil,
		_ message: String,
		okTitle: String = defaultOkTitle,
		onDismiss: OnAlertDismiss? = nil
		)
	{
		alert(
			title: title,
			message,
			actions: [
				UIViewController.okAlertAction(
					title: okTitle,
					onDismiss: onDismiss
				)
			]
		)
	}
}



// MARK: - Confirmation

extension UIViewController
{
	func alertConfirmation(
		title: String? = nil,
		message: String,
		confirmTitle: String,
		cancelTitle: String,
		onConfirm: @escaping () -> Void
		)
	{
		let confirmAction = UIAlertAction(
			title: confirmTitle,
			style: .default,
			handler: { _ in
				onConfirm()
			}
		)
		let cancelAction = UIAlertAction(
			title: cancelTitle,
			style: .cancel
		)
		alert(
			title: title,
			message,
			actions: [
				confirmAction,
				cancelAction
			]
		)
	}
}
