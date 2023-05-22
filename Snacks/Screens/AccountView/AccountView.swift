//
//  AccountView.swift
//  Snacks
//
//  Created by Dogukaim on 18.05.2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccounViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName,lastName,email
    }
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Personel Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField,equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday",
                               selection: $viewModel.user.birhtdate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins",isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills",isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("🤓 Account")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
