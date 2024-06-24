//
//  PaymentView.swift
//  NS2
//
//  Created by Jaled Jara on 6/5/24.
//


import SwiftUI
import SafariServices

struct PaymentView: View {
    var body: some View {
        VStack {
            Button("Open Preference" ) {
                if let url = URL(string:"YOUR-URL-PREFERENCE")
                {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let rootViewController = windowScene.windows.first?.rootViewController {
                            let safariVC = SFSafariViewController(url: url)
                            rootViewController.present(safariVC, animated: true, completion: nil)
                        }
                    }
                    
                }
                
            }
        }
        .padding()
    }

}

#Preview {
    PaymentView()
}
