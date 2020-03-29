//
//  UIViewController+TBSNavigationController.m
//  theBeastApp
//
//  Created by 付朋华 on 2018/12/7.
//  Copyright © 2018 com.thebeastshop. All rights reserved.
//

#import "UIViewController+navigationController.h"
#import <objc/runtime.h>
#import "UINavigationBar+navigationController.h"


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define statusBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height)

@interface UIViewController ()
@property (nonatomic, weak) UINavigationController *tbs_navigationController;
@property (nonatomic, strong) TBSNavigationItem *tbs_navigation_item;
@end
@implementation UIViewController (navigationController)
+ (void)load {
    [UINavigationBar navBar_exchangeInstanceMethod:[self class] originalSel:@selector(navigationItem) newSel:@selector(tbs_navigationItem)];
    
    [UINavigationBar navBar_exchangeInstanceMethod:[self class] originalSel:@selector(setTitle:) newSel:@selector(tbs_setTitle:)];
    
}

//#pragma mark - 以下为方法替换
- (void)tbs_setTitle:(NSString *)title {
    [self tbs_setTitle:title];
    if (self.tbs_navigation_item) {
        self.tbs_navigation_item.title=title;
    }
}

- (UINavigationItem *)tbs_navigationItem {
    if (self.tbs_navigation_item) {
        return self.tbs_navigation_item;
    }
    return  [self tbs_navigationItem];
}

#pragma mark - 以下为私有方法
- (void)bringNavigationBarToFront {
    [self.view bringSubviewToFront:self.navigationBar];
}

- (void)removeNavigationBar {
    if (self.navigationBar) {
        [self.navigationBar removeFromSuperview];
        self.navigationBar = nil;
        self.tbs_navigation_item = nil;
    }
}
- (void)reloadNavigationBar {
    [self removeNavigationBar];
    CGSize size = [UIApplication sharedApplication].statusBarFrame.size;
    TBSNavigationBar *navigationBar = [[TBSNavigationBar alloc]init];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    navigationBar.frame = CGRectMake(0, size.height, size.width, 44);
    self.view.isViewControllerBaseView=YES;
    
    self.navigationBar = navigationBar;
    [self.view addSubview:navigationBar];
    self.tbs_navigation_item = [[TBSNavigationItem alloc]init];
    navigationBar.items = @[self.tbs_navigation_item];
}

- (UIImage*)tbs_imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 以下为增加属性
- (void)setTbs_navigation_item:(TBSNavigationItem *)tbs_navigation_item {
    objc_setAssociatedObject(self, @selector(tbs_navigation_item), tbs_navigation_item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TBSNavigationItem *)tbs_navigation_item {
    return  objc_getAssociatedObject(self, _cmd);
}

- (UINavigationController *)tbs_navigationController {
    return  objc_getAssociatedObject(self, _cmd);
}
- (void)setTbs_navigationController:(UINavigationController *)tbs_navigationController {
    objc_setAssociatedObject(self, @selector(tbs_navigationController), tbs_navigationController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNavigationBar:(TBSNavigationBar *)navigationBar {
    objc_setAssociatedObject(self, @selector(navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TBSNavigationBar *)navigationBar {
    return  objc_getAssociatedObject(self, _cmd);
}

- (void)setStatusBarBgView:(UIView *)statusBarBgView {
    objc_setAssociatedObject(self, @selector(statusBarBgView), statusBarBgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)statusBarBgView {
    return objc_getAssociatedObject(self, _cmd);
}

//覆盖一个伪StatusBar
- (void)addPseudoStatusBar {
    UIView *statusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, statusBarHeight)];
    statusBar.viewLevel = UIViewLevelHigh;
    statusBar.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:statusBar];
    self.statusBarBgView = statusBar;
}

- (UIModalPresentationStyle)modalPresentationStyle{
    return UIModalPresentationFullScreen;
}
@end
