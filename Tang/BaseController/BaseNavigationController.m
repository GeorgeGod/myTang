//
//  BaseNavigationController.m
//  Tang
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    /* 1.设置导航条标题字体颜色以及大小*/
    [navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    /* 2.设置导航条颜色 */
    [navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    navigationBar.shadowImage = [UIImage new];
    
    /* 3.改变导航栏返回按钮颜色*/
    [navigationBar setTintColor:[UIColor whiteColor]];
}


/**
 设置导航控制器的根控制器

 @param rootViewController 根控制器
 @return 导航控制器对象
 */
+(instancetype)RootViewCtrl:(UIViewController *)rootViewController {
    if (!rootViewController) {
        NSLog(@"导航控制器的根控制器不能为空！");
        rootViewController = [UIViewController new];
    }
    BaseNavigationController *navigationCtrl = [[BaseNavigationController alloc] initWithRootViewController:rootViewController];
    return navigationCtrl;
}

@end
