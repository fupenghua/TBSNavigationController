//
//  TBSNavigationItem.m
//  navigationController
//
//  Created by 付朋华 on 2020/3/29.
//  Copyright © 2020 JSSClubee. All rights reserved.
//

#import "TBSNavigationItem.h"

@implementation TBSNavigationItem

-(void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem {
    //解决ios11以下系统 设置leftBarButtonItem不显示问题 通过延迟也可以解决 但是此方法不用延时也可以解决
    dispatch_async(dispatch_get_main_queue(), ^{
        [super setLeftBarButtonItem:leftBarButtonItem];
    });
}

- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems {
    //解决ios11以下系统 设置leftBarButtonItem不显示问题 通过延迟也可以解决 但是此方法不用延时也可以解决
    dispatch_async(dispatch_get_main_queue(), ^{
        [super setLeftBarButtonItems:leftBarButtonItems];
    });
}


@end
