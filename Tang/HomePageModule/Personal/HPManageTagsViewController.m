//
//  HPManageTagsViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPManageTagsViewController.h"
#import "UIColor+Extension.h"
#import "UIImage+Path.h"
#import "HPTagsContentViewController.h"

@interface HPManageTagsViewController ()
{
    NSArray<NSString *> *titleArray;
}
@end

@implementation HPManageTagsViewController

#pragma mark 初始化代码
- (instancetype)init {
    if (self = [super init]) {
        
        titleArray = @[@"身份标签", @"技能标签", @"喜好标签"];
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = [UIScreen mainScreen].bounds.size.width / titleArray.count;
        self.menuHeight = 44;
        self.titleColorSelected = [UIColor colorWithHexString:@"#222222"];
        self.titleColorNormal = [UIColor colorWithHexString:@"#999999"];
        self.menuBGColor = [UIColor whiteColor];
        self.progressWidth = 15;
        self.progressHeight = 4;
        self.bounces = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"标签";
    
    //左按钮
    UIBarButtonItem *gap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    gap.width = -5;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage load:@"back_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
    self.navigationItem.leftBarButtonItems = @[gap, leftItem];

    //右按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemAction:)];
    
    self.navigationItem.rightBarButtonItems = @[gap, rightItem];
}
-(void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    //保存数据
}


#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    HPTagsContentViewController *contentCtrl = [HPTagsContentViewController new];
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
