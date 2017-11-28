//
//  MineModel.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 我的头像模型
 */
@interface MineHeadModel : NSObject

@property (nonatomic, strong) NSString *portrait; //头像
@property (nonatomic, strong) NSString *name; //姓名
@property (nonatomic, assign) BOOL isVIP; //是否VIP
@property (nonatomic, assign) BOOL isMAKER; //是否MAKER
@property (nonatomic, assign) BOOL accessory; //右侧箭头
@property (nonatomic, strong) NSString *detail; //(职位)描述

+(instancetype)MineModel;
@end



/**
 我的分类模型
 */
@interface MineClassifyModel : NSObject

@property (nonatomic, strong) NSString *logo; //图标
@property (nonatomic, strong) NSString *title; //图标对应的汉字说明
@property (nonatomic, assign) BOOL unread; //未读消息

+(instancetype)MineClassifyModel:(NSString *)logo withTitle:(NSString *)title;
@end


/**
 通用模型
 */
@interface MineModel : NSObject

@property (nonatomic, strong) NSString *title; //标题
@property (nonatomic, assign) BOOL unread; //未读消息
@property (nonatomic, assign) BOOL accessory; //右侧箭头

+(instancetype)MineModel:(NSString *)title;
@end
