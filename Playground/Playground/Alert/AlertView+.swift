//
//  AlertView+.swift
//  RebornCar
//
//  Created by 양중창 on 2022/07/29.
//

import SwiftUI

extension View {
    
//    @ViewBuilder
    func alerts(models: Binding<[AlertModel]>) {
        
    }
    
    @ViewBuilder
    func alert(model: Binding<AlertModel>) -> some View {
        if #available(iOS 15.0, *) {
            self.alert(model)
        } else {
            self.deprecatedAlert(model)
        }
    }

    @available(iOS 15.0, *)
    private func alert(_ model: Binding<AlertModel>) -> some View {
        let modelValue = model.wrappedValue

        let buttons = ForEach(modelValue.actions) { action in
            self.convertAlertActionModelToButton(action)
        }
        
        return self.alert(modelValue.title,
                          isPresented: model.isPresent,
                          actions: { buttons },
                          message: {
            if let message = modelValue.message {
                Text(message)
            } else {
                EmptyView()
            }
        })
    }
    
    @available(iOS 15.0, *)
    private func convertAlertActionModelToButton(_ model: AlertActionModel) -> some View {
        let buttonRole = self.convertAlertActionStyleToButtonRole(model.style)
        return Button(model.title, role: buttonRole, action: model.action)
    }

    @available(iOS 15.0, *)
    private func convertAlertActionStyleToButtonRole(_ style: AlertActionStyle) -> ButtonRole? {
        switch style {
        case .default:
            return nil
        case .cancel:
            return .cancel
        case .destructive:
            return .destructive
        }
    }

    private func deprecatedAlert(_ model: Binding<AlertModel>) -> some View {
        let modelValue = model.wrappedValue

        let alert: Alert
        let title = Text(modelValue.title)
        let message = modelValue.message != nil ? Text(modelValue.message ?? ""): nil
        switch modelValue.actions.count {
        case 1:
            let action = modelValue.actions[0]
            alert = Alert(title: title,
                          message: message,
                          dismissButton: self.convertAlertActionModelToDeprecatedAlertButton(action))
        case 2:
            let primaryAction = modelValue.actions[0]
            let secondaryAction = modelValue.actions[1]
            alert = Alert(title: title,
                          message: message,
                          primaryButton: self.convertAlertActionModelToDeprecatedAlertButton(primaryAction),
                          secondaryButton: self.convertAlertActionModelToDeprecatedAlertButton(secondaryAction))
        default:
            alert = Alert(title: title,
                          message: message)
        }

        return self.alert(isPresented: model.isPresent,
                          content: { alert })
    }

    private func convertAlertActionModelToDeprecatedAlertButton(_ model: AlertActionModel) -> Alert.Button {
        let title = Text(model.title)
        switch model.style {
        case .default:
            return .default(title, action: model.action)
        case .cancel:
            return .cancel(title, action: model.action)
        case .destructive:
            return .destructive(title, action: model.action)
        }
    }
}
