//
//  UINavigationController+StatusBar.m
//  theBeastApp
//
//  Created by 付朋华 on 2018/4/8.
//  Copyright © 2018年 com.thebeastshop. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden {
    return [[self topViewController] prefersStatusBarHidden];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

@end
