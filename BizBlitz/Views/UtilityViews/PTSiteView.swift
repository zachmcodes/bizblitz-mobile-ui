//
//  PTSiteView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import SwiftUI

struct PTSiteView: View {
    
    let url: String?
    
    var body: some View {
        PTWebView(urlString: url)
    }
}

struct PTSiteView_Previews: PreviewProvider {
    static var previews: some View {
        PTSiteView(url: "www.google.com")
    }
}
