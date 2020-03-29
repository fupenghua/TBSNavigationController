//
//  TBSNavigationBar.m
//  navigationController
//
//  Created by 付朋华 on 2020/3/29.
//  Copyright © 2020 JSSClubee. All rights reserved.
//

#import "TBSNavigationBar.h"

@implementation TBSTopNavigationBar
@end

@implementation TBSNavigationBar

-(void)layoutSubviews{
    [super layoutSubviews];
    [self resetUIBarBackground];
}

- (void)resetUIBarBackground {
    for (UIView *view in self.subviews) {
        NSString *className=NSStringFromClass([view class]);
        if ([className isEqualToString:@"_UIBarBackground"]) {
            CGFloat height=[UIApplication sharedApplication].statusBarFrame.size.height;
            CGRect frame=self.bounds;
            frame.size.height =self.frame.size.height+height;
            frame.origin.y=-height;
            view.frame=frame;
        }
    }
}

@end

