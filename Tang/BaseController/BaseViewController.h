//
//  BaseViewController.h
//  Tang
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) void(^leftBarButtonItem)(id item);
@property (nonatomic, strong) void(^rightBarButtonItem)(id item);

/**
 初始化UI
 */
-(void)initView;

/**
 初始化数据
 */
-(void)initData;


/**
 请求网络数据
 */
-(void)requestData;

-(void)leftBarButtonItemAction:(UIBarButtonItem *)leftBarButtonItem;
-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem;



/**
 push出控制器

 @param clazz 控制器类名
 */
-(void)pushViewController:(Class)clazz;

/**
 弹出控制器
 */
-(void)popViewController;

/**
 present出控制器

 @param clazz 控制器类名
 */
-(void)displayViewController:(Class)clazz;

/**
 弹出控制器
 */
-(void)dismissViewController;


@end
