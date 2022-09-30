//
//  OCHUIPreview.swift
//  ObjectiveCHelper
//
//  Created by Apple on 2022/9/30.
//

import SwiftUI

struct OCHUIPreview: View {
    var body: some View {
        ZStack {
//            UIViewRepresent(OCHTestView())
//            UIViewControllerRepresent(OCHTestViewController())
            UIViewControllerRepresent(OCHUIScrollViewController());
        }
    }
}

struct OCHUIPreview_Previews: PreviewProvider {
    static var previews: some View {
        OCHUIPreview()//.ignoresSafeArea()
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
