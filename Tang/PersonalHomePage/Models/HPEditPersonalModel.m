//
//  HPEditPersonalModel.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPEditPersonalModel.h"

@implementation HPEditPersonalModel
+(instancetype)EditModel:(NSString *)title detail:(NSString *)detail place:(NSString *)placeholder show:(BOOL)show {
    HPEditPersonalModel *model = [HPEditPersonalModel new];
    model.title = title;
    model.detail = detail;
    model.placeholder = placeholder;
    model.showArrow = show;
    return model;
}
@end
