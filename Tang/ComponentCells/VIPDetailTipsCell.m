//
//  VIPDetailTipsCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailTipsCell.h"

@implementation VIPDetailTipsCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    UILabel *label = [UILabel new];
    label.text = @"*开通会员后，所有特权立即生效，会员专属大礼包需要联系客服领取。\n会员权益同时只可购买一个月，需要当月权益过期后方可购买下一个月的权益。\n最终解释权归INNOSPACE+所有";
    label.numberOfLines = 0;
    label.font = [UIFont font:12];
    label.textColor = [UIColor colorWithHexString:@"#999999"];
    [self.contentView addSubview:label];
    self.title = label;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 20, 0, 20));
    }];
}

@end
