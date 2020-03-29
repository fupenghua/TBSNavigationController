//
//  UIViewController+TBSNavigationController.h
//  theBeastApp
//
//  Created by 付朋华 on 2018/12/7.
//  Copyright © 2018 com.thebeastshop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBSNavigationBar.h"
#import "TBSNavigationItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (navigationController)
@property (nonatomic, weak) TBSNavigationBar *navigationBar;
@property (nonatomic, strong) TBSNavigationItem *tbs_navigation_item;


/**
  执行addPseudoStatusBar 添加的假的状态栏
 */
@property (nonatomic, strong) UIView *statusBarBgView;

//创建UINavigationBar
-(void)reloadNavigationBar;

//删除UINavigationBar
-(void)removeNavigationBar;

//根据UIColor生成UIImage
- (UIImage*)tbs_imageWithColor:(UIColor*)color;

//覆盖一个伪StatusBar default whiteColor
- (void)addPseudoStatusBar;

@end

NS_ASSUME_NONNULL_END
