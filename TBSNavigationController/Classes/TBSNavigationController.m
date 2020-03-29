//
//  TBSNavigationController.m
//  navigationController
//
//  Created by 付朋华 on 2020/3/29.
//  Copyright © 2020 JSSClubee. All rights reserved.
//

#import "TBSNavigationController.h"
#import "TBSNavigationBar.h"

@interface TBSNavigationController ()

@end

@implementation TBSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetNavigationBar];
    // Do any additional setup after loading the view.
}
- (void)resetNavigationBar {
    self.navigationBar.hidden = YES;
    TBSTopNavigationBar *navbar = [[TBSTopNavigationBar alloc]init];
    navbar.hidden = NO;
    [self setValue:navbar forKeyPath:@"_navigationBar"];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
