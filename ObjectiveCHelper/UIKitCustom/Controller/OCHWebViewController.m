//
//  OCHWebViewController.m
//  ObjectiveCHelper
//
//  Created by Sauron on 2022/12/7.
//  Copyright © 2022 com.sauronpi. All rights reserved.
//

#import "OCHWebViewController.h"
#import <Masonry/Masonry.h>
#import <WebKit/WebKit.h>

@interface OCHWebViewController () <WKNavigationDelegate>

@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIProgressView *progressView;

@end

@implementation OCHWebViewController

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureWebView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
    [self loadURLString:@"https://www.baidu.com"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"])  {
        NSLog(@"estimatedProgress: %@", @(self.webView.estimatedProgress));
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
    }
}

- (void)configureWebView {
    WKWebView *webView = [[WKWebView alloc] init];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
    self.webView  = webView;
    
    UIProgressView *progressView = [[UIProgressView alloc] init];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(4));
    }];
    self.progressView = progressView;
}

- (void)loadURLString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if (url) {
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
//        dispatch_async(dispatch_get_main_queue(), ^{
//        });
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        });
    }
}

- (void)loadRequest:(NSURLRequest *)request {
    
}

// MARK: - WKNavigationDelegate

/*! @abstract Decides whether to allow or cancel a navigation.
 @param webView The web view invoking the delegate method.
 @param navigationAction Descriptive information about the action
 triggering the navigation request.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationActionPolicy.
 @discussion If you do not implement this method, the web view will load the request or, if appropriate, forward it to another application.
 */
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler WK_SWIFT_ASYNC(3) {
//
//}

/*! @abstract Decides whether to allow or cancel a navigation.
 @param webView The web view invoking the delegate method.
 @param navigationAction Descriptive information about the action
 triggering the navigation request.
 @param preferences The default set of webpage preferences. This may be
 changed by setting defaultWebpagePreferences on WKWebViewConfiguration.
 @param decisionHandler The policy decision handler to call to allow or cancel
 the navigation. The arguments are one of the constants of the enumerated type
 WKNavigationActionPolicy, as well as an instance of WKWebpagePreferences.
 @discussion If you implement this method,
 -webView:decidePolicyForNavigationAction:decisionHandler: will not be called.
 */
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction preferences:(WKWebpagePreferences *)preferences decisionHandler:(void (^)(WKNavigationActionPolicy, WKWebpagePreferences *))decisionHandler WK_SWIFT_ASYNC(4) API_AVAILABLE(macos(10.15), ios(13.0)) {
//
//}

/*! @abstract Decides whether to allow or cancel a navigation after its
 response is known.
 @param webView The web view invoking the delegate method.
 @param navigationResponse Descriptive information about the navigation
 response.
 @param decisionHandler The decision handler to call to allow or cancel the
 navigation. The argument is one of the constants of the enumerated type WKNavigationResponsePolicy.
 @discussion If you do not implement this method, the web view will allow the response, if the web view can show it.
 */
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler WK_SWIFT_ASYNC(3) {
//
//}

/*! @abstract Invoked when a main frame navigation starts.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
    if (!self.title) {
        self.title = @"loading";
    }
    dispatch_async(dispatch_get_main_queue(), ^{
    });
//    NSLog(@"web view progress %@", @(webView.estimatedProgress));
//    [self.progressView setProgress:webView.estimatedProgress animated:YES];
}

/*! @abstract Invoked when a server redirect is received for the main
 frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}

/*! @abstract Invoked when an error occurs while starting to load data for
 the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

/*! @abstract Invoked when content starts arriving for the main frame.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    
}

/*! @abstract Invoked when a main frame navigation completes.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    self.title = webView.title;
    self.progressView.hidden = YES;
//    NSLog(@"web view progress %@", @(webView.estimatedProgress));
//    [self.progressView setProgress:webView.estimatedProgress animated:YES];
}

/*! @abstract Invoked when an error occurs during a committed main frame
 navigation.
 @param webView The web view invoking the delegate method.
 @param navigation The navigation.
 @param error The error that occurred.
 */
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

/*! @abstract Invoked when the web view needs to respond to an authentication challenge.
 @param webView The web view that received the authentication challenge.
 @param challenge The authentication challenge.
 @param completionHandler The completion handler you must invoke to respond to the challenge. The
 disposition argument is one of the constants of the enumerated type
 NSURLSessionAuthChallengeDisposition. When disposition is NSURLSessionAuthChallengeUseCredential,
 the credential argument is the credential to use, or nil to indicate continuing without a
 credential.
 @discussion If you do not implement this method, the web view will respond to the authentication challenge with the NSURLSessionAuthChallengeRejectProtectionSpace disposition.
 */
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler WK_SWIFT_ASYNC_NAME(webView(_:respondTo:)) {
//
//}

/*! @abstract Invoked when the web view's web content process is terminated.
 @param webView The web view whose underlying web content process was terminated.
 */
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macos(10.11), ios(9.0)) {
    
}

/*! @abstract Invoked when the web view is establishing a network connection using a deprecated version of TLS.
 @param webView The web view initiating the connection.
 @param challenge The authentication challenge.
 @param decisionHandler The decision handler you must invoke to respond to indicate whether or not to continue with the connection establishment.
 */
- (void)webView:(WKWebView *)webView authenticationChallenge:(NSURLAuthenticationChallenge *)challenge shouldAllowDeprecatedTLS:(void (^)(BOOL))decisionHandler WK_SWIFT_ASYNC_NAME(webView(_:shouldAllowDeprecatedTLSFor:)) WK_SWIFT_ASYNC(3) API_AVAILABLE(macos(11.0), ios(14.0)) {
    
}

/*
 @abstract Called after using WKNavigationActionPolicyDownload.
 @param webView The web view that created the download.
 @param navigationAction The action that is being turned into a download.
 @param download The download.
 @discussion The download needs its delegate to be set to receive updates about its progress.
*/
- (void)webView:(WKWebView *)webView navigationAction:(WKNavigationAction *)navigationAction didBecomeDownload:(WKDownload *)download API_AVAILABLE(macos(11.3), ios(14.5)) {
    
}

/*
 @abstract Called after using WKNavigationResponsePolicyDownload.
 @param webView The web view that created the download.
 @param navigationResponse The response that is being turned into a download.
 @param download The download.
 @discussion The download needs its delegate to be set to receive updates about its progress.
*/
- (void)webView:(WKWebView *)webView navigationResponse:(WKNavigationResponse *)navigationResponse didBecomeDownload:(WKDownload *)download API_AVAILABLE(macos(11.3), ios(14.5)) {
    
}

@end
