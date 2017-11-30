//
//  MemberCenterStatusModel.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberCenterStatusModel : NSObject

@property (nonatomic, copy  ) NSString *Service; //购买的服务名称 如:包月InnoMaker会员
@property (nonatomic, copy  ) NSString *DeadLint; //到期日期 如:2017-11-29
@property (nonatomic, assign) int Status; //申请状态 0：未开通会员，1：已申请，2：已开通会员但是未租用储物箱（储物箱）
@property (nonatomic, copy  ) NSString *Price; //价格

@end
