//
//  OCHPreviewHelper.swift
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/10/1.
//

import SwiftUI

@available(iOS 13.0, *)
struct OCHPreviewHelper: View {
    var body: some View {
        ZStack {
            Color.gray;
//            VStack {
                UIViewRepresent(OCHPreview())
//                Spacer()
//            }
                .frame(maxHeight: 500)
//            UIViewControllerRepresent(OCHPreviewController())
//            UIViewControllerRepresent(OCHJXCategoryViewController())
        }
    }
}

@available(iOS 13.0, *)
struct OCHUIHelper_Previews: PreviewProvider {
    static var previews: some View {
        OCHPreviewHelper()
    }
}

#if canImport(UIKit)
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
struct UIViewRepresent<T: UIView>: UIViewRepresentable {
    let view: T
    
    init(_ view: T) {
        self.view = view
    }

    func makeUIView(context: Context) -> T {
        return view
    }
    
    func updateUIView(_ uiView: T, context: Context) {
        
    }
    
    typealias UIViewType = T
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIViewControllerRepresent<T: UIViewController>: UIViewControllerRepresentable {
    public let viewController: T
    
    public init(_ viewController: T) {
        self.viewController = viewController
    }
    
    public func makeUIViewController(context: Context) -> UIViewControllerType {
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    public typealias UIViewControllerType = T
}
#endif
