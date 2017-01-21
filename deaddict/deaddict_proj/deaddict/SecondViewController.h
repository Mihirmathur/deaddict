//
//  SecondViewController.h
//  deaddict
//
//  Created by Shashank Khanna on 1/21/17.
//  Copyright © 2017 Shashank Khanna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@interface SecondViewController : UIViewController
@property(strong,nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *productURL;
@end

