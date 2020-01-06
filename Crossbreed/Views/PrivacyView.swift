//
//  PrivacyView.swift
//  Crossbreed
//
//  Created by Matthew Jones on 2020-01-05.
//  Copyright © 2020 Matthew Jones. All rights reserved.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("Privacy Policy")
                        .font(.system(.title))
                    Text("This policy applies to all information collected or submitted on Crossbreed’s website and our apps for iPhone and any other devices and platforms.")
                }
                Group {
                    Text("Information we collect")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("We do not store any of your data. None of your searches are saved anywhere. Crossbreed displays your search results, and nothing more. In the future, if new functionality is added to Crossbreed, we may need to store your data. Under such a scenario, we will update existing users to the new privacy policy.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                Group {
                    Text("Technical Basics")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("Crossbreed interfaces with a third party API. The third party API may store basic technical information, such as your IP address, in temporary memory or logs.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                Group {
                    Text("Security")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("We implement a variety of security measures to help keep your information secure. For instance, all communication with the app and website requires HTTPS with certificate pinning.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                Group {
                    Text("International Transfers of Information")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("Information may be processed, stored, and used outside of the country in which you are located. Data privacy laws vary across jurisdictions, and different laws may be applicable to your data depending on where it is processed, stored, or used.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                Group {
                    Text("Your Consent")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("By using our site or apps, you consent to our privacy policy.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                
                Group {
                    Text("Contacting Us")
                        .font(.system(.headline))
                        .padding(.top)
                    Text("If you have questions regarding this privacy policy, you may email privacy@Crossbreed.fm. Please note that account deletion should be done within the Crossbreed app, not via email requests, for security reasons.")
                        .font(.system(.body))
                        .padding(.top)
                        .multilineTextAlignment(.leading)
                }
                
            }.padding()
        }.navigationBarTitle("Privacy Policy")
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
