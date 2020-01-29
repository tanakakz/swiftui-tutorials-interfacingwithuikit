//
//  PageView.swift
//  Landmarks
//
//  Created by tkz on 2020/01/29.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 1
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            Text("Current Page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map {FeatureCard(landmark: $0) })
            .aspectRatio(3/2, contentMode: .fit)
    }
}
