//
//  BaseViewController.m
//  Tang
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //调用初始化试图
    if ([self respondsToSelector:@selector(initView)]) {
        [self initView];
    }
    
    //调用初始化数据
    if ([self respondsToSelector:@selector(initData)]) {
        [self initData];
    }
    
    //调用请求网络数据
    if ([self respondsToSelector:@selector(requestData)]) {
        [self requestData];
    }
    
    //初始化导航栏的左右按钮
    if ([self respondsToSelector:@selector(initBarButton)]) {
        [self initBarButton];
    }
}


/**
 初始化导航栏的左右按钮
 */
-(void)initBarButton {
    //左按钮
    __weak typeof(self) weakSelf = self;
    self.leftBarButtonItem = ^(id item) {
        
        UIBarButtonItem *gap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        gap.width = -5;
        
        if ([item isKindOfClass:[NSString class]]) {
            
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:item style:UIBarButtonItemStylePlain target:weakSelf action:@selector(leftBarButtonItemAction:)];
            
            weakSelf.navigationItem.leftBarButtonItems = @[gap, leftItem];
            
        } else if ([item isKindOfClass:[UIImage class]]) {
            
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:item style:UIBarButtonItemStylePlain target:weakSelf action:@selector(leftBarButtonItemAction:)];
            weakSelf.navigationItem.leftBarButtonItems = @[gap, leftItem];
        }
    };
    //右按钮
    self.rightBarButtonItem = ^(id item) {
        
        UIBarButtonItem *gap = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        gap.width = -5;
        
        if ([item isKindOfClass:[NSString class]]) {
            
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:item style:UIBarButtonItemStylePlain target:weakSelf action:@selector(rightBarButtonItemAction:)];
            
            weakSelf.navigationItem.rightBarButtonItems = @[gap, rightItem];
            
        } else if ([item isKindOfClass:[UIImage class]]) {
            
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:item style:UIBarButtonItemStylePlain target:weakSelf action:@selector(rightBarButtonItemAction:)];
            weakSelf.navigationItem.rightBarButtonItems = @[gap, rightItem];
        }
    };
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem { }
-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem { }


-(void)pushViewController:(Class)clazz {
    UIViewController *ctrl = [clazz new];
    if ([ctrl isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:ctrl animated:YES];
    } else {
        NSLog(@"弹出的必须是控制器！");
    }
}

-(void)popViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)displayViewController:(Class)clazz {
    UIViewController *ctrl = [clazz new];
    if ([ctrl isKindOfClass:[UIViewController class]]) {
        BaseNavigationController *navigationCtrl = [BaseNavigationController RootViewCtrl:ctrl];
        [self presentViewController:navigationCtrl animated:YES completion:nil];
    } else {
        NSLog(@"弹出的必须是控制器！");
    }
}

-(void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
