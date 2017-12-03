//
//  MemberCenterCtrl.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberCenterCtrl.h"
#import "EnjoySectionHeader.h"
#import "MemberCenterCell.h"
#import "MemberEnjoyCell.h"
#import "MemberCenterTipsCell.h"
#import "MCContentCtrl.h"
#import "VIPConfirmOrderViewController.h"
#import "VIPDetailViewController.h"

@interface MemberCenterCtrl ()
{
    int currentPage; //当前Page
    NSArray<NSString *> *titleArray;
}
@end

@implementation MemberCenterCtrl


#pragma mark 初始化代码
- (instancetype)init {
    if (self = [super init]) {
        
        self.menuHeight = 0;
        titleArray = @[@"VIP", @"Maker", @"储物箱"];
        self.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"会员中心";
    //左按钮
    UIBarButtonItem *gap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    gap.width = -5;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage load:@"back_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
    self.navigationItem.leftBarButtonItems = @[gap, leftItem];
    
    //右按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"联系客服" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction:)];
    
    self.navigationItem.rightBarButtonItems = @[gap, rightItem];
}
-(void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    [ContactCustomerService ContactCustomerService];
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    MCContentCtrl *contentCtrl = [MCContentCtrl new];
    contentCtrl.currentPage = index;
    return contentCtrl;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectZero;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return self.view.bounds;
}

@end
