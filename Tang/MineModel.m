//
//  MineModel.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MineModel.h"

@implementation MineHeadModel

+(instancetype)MineModel {
    
    MineHeadModel *model = [MineHeadModel new];
    
    model.portrait = @"";
    model.name = @" ";
    model.isVIP = NO;
    model.isMAKER = NO;
    model.accessory = YES;
    model.detail = @" ";
    return model;
}
@end


@implementation MineClassifyModel

+(instancetype)MineClassifyModel:(NSString *)logo withTitle:(NSString *)title {
    MineClassifyModel *model = [MineClassifyModel new];
    model.logo = logo;
    model.title = title;
    model.unread = NO;
    
    return model;
}
@end



@implementation MineModel

+(instancetype)MineModel:(NSString *)title {
    
    MineModel *model = [MineModel new];
    model.title = title;
    model.unread = NO;
    model.accessory = YES;
    
    return model;
}
@end
