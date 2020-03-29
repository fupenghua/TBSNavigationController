//
//  UINavigationBar+TBSNavigationController.h
//  theBeastApp
//
//  Created by 付朋华 on 2018/12/7.
//  Copyright © 2018 com.thebeastshop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBSNavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

//UIView的level用于在当前view上添加覆盖整个屏幕的view并且不被navigationBar覆盖
typedef NS_ENUM(NSInteger,UIViewLevel){
    UIViewLevelLow=0,
    UIViewLevelMiddle,
    UIViewLevelHigh
};

@interface UINavigationBar (navigationController)
+ (void)navBar_exchangeInstanceMethod:(Class) dClass originalSel:(SEL)originalSelector newSel:(SEL)newSelector;

@end

@interface UIView (navigationController)

@property (nonatomic,assign) UIViewLevel viewLevel;

//是ViewController的根view
@property (nonatomic,assign) BOOL isViewControllerBaseView;

@end

NS_ASSUME_NONNULL_END
