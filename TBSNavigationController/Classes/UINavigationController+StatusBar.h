//
//  UINavigationController+StatusBar.h
//  theBeastApp
//
//  Created by 付朋华 on 2018/4/8.
//  Copyright © 2018年 com.thebeastshop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StatusBar)<UINavigationBarDelegate>
- (UIStatusBarStyle)preferredStatusBarStyle;

- (BOOL)prefersStatusBarHidden;

- (UIInterfaceOrientationMask)supportedInterfaceOrientations;

@end
