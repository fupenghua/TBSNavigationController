//
//  UINavigationBar+TBSNavigationController.m
//  theBeastApp
//
//  Created by 付朋华 on 2018/12/7.
//  Copyright © 2018 com.thebeastshop. All rights reserved.
//

#import "UINavigationBar+navigationController.h"
#import <objc/runtime.h>
#import "TBSNavigationBar.h"
#import "UIViewController+navigationController.h"

UIKIT_STATIC_INLINE NSString * decodeBase64String(NSString *base64String) {
    NSData *nsdataFromBase64String = [[NSData alloc]
                                         initWithBase64EncodedString:base64String options:0];
       
       NSString *base64Decoded = [[NSString alloc]
                                  initWithData:nsdataFromBase64String encoding:NSUTF8StringEncoding];
       return base64Decoded;
}


@implementation UINavigationBar (navigationController)

+ (void)navBar_exchangeInstanceMethod : (Class) dClass originalSel :(SEL)originalSelector newSel: (SEL)newSelector
{
    Method originalMethod = class_getInstanceMethod(dClass, originalSelector);
    Method newMethod = class_getInstanceMethod(dClass, newSelector);
    //将 newMethod的实现 添加到系统方法中 也就是说 将 originalMethod方法指针添加成
    //方法newMethod的  返回值表示是否添加成功
    BOOL isAdd = class_addMethod(dClass, originalSelector,
                                 method_getImplementation(newMethod),
                                 method_getTypeEncoding(newMethod));
    //添加成功了 说明 本类中不存在新方法
    //所以此时必须将新方法的实现指针换成原方法的，否则 新方法将没有实现。
    if (isAdd) {
        class_replaceMethod(dClass, newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        //添加失败了 说明本类中 有methodB的实现，此时只需要将
        // originalMethod和newMethod的IMP互换一下即可。
        method_exchangeImplementations(originalMethod, newMethod);
    }
    
}
+ (void)load {
    Class dClass=[self class];
    SEL originalSelector = NSSelectorFromString(decodeBase64String(@"cHVzaE5hdmlnYXRpb25JdGVtOg=="));

    [self navBar_exchangeInstanceMethod:dClass originalSel:originalSelector newSel:@selector(tbs_pushNavigationItem:)];
    [self navBar_exchangeInstanceMethod:dClass originalSel:@selector(pushNavigationItem:animated:) newSel:@selector(tbs_pushNavigationItem:animated:)];
    
}


- (void)tbs_pushNavigationItem:(UINavigationItem *)item {
    if ([self isKindOfClass:[TBSTopNavigationBar class]]) {
        item = [[UINavigationItem alloc]init];
        item.leftBarButtonItem = [UIBarButtonItem new];
    }
    [self tbs_pushNavigationItem:item];
}

- (void)tbs_pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated {
    if ([self isKindOfClass:[TBSTopNavigationBar class]]) {
        item = [[UINavigationItem alloc]init];
    }
    [self tbs_pushNavigationItem:item animated:animated];
}

@end

@implementation UIView (navigationController)

+ (void)load {
    [UINavigationBar navBar_exchangeInstanceMethod:[self class] originalSel:@selector(didAddSubview:) newSel:@selector(tbs_didAddSubview:)];
    [UINavigationBar navBar_exchangeInstanceMethod:[self class] originalSel:@selector(bringSubviewToFront:) newSel:@selector(tbs_bringSubviewToFront:)];
}
- (BOOL)isViewControllerBaseView {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsViewControllerBaseView:(BOOL)isViewControllerBaseView {
    objc_setAssociatedObject(self, @selector(isViewControllerBaseView), @(isViewControllerBaseView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setViewLevel:(UIViewLevel)viewLevel {
    objc_setAssociatedObject(self, @selector(viewLevel), @(viewLevel), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIViewLevel)viewLevel {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}


- (void)tbs_didAddSubview:(UIView *)subview {
    [self tbs_didAddSubview:subview];
    [self bringNavigationBarToFront:subview];
}

- (void)tbs_bringSubviewToFront:(UIView *)view {
    [self tbs_bringSubviewToFront:view];
    [self bringNavigationBarToFront:view];
}

- (void)bringNavigationBarToFront:(UIView *)subView {
    if (self.isViewControllerBaseView) {
        if (subView.viewLevel == UIViewLevelHigh) return;
        UIViewController *vc = (UIViewController*)[self nextResponder];
        if ([vc isKindOfClass:[UIViewController class]]) {
            if(vc.navigationBar){
                [self tbs_bringSubviewToFront:vc.navigationBar];
            }
        }
    }
}

@end
