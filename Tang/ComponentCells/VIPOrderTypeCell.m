//
//  VIPOrderTypeCell.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPOrderTypeCell.h"

@interface VIPOrderTypeCell()
@property (weak, nonatomic) IBOutlet UILabel *orderType;//开通权限
@property (weak, nonatomic) IBOutlet UIButton *contactAdmin;//联系管理员
@property (weak, nonatomic) IBOutlet UIImageView *productLogo;
@property (weak, nonatomic) IBOutlet UILabel *orderName;
@property (weak, nonatomic) IBOutlet UILabel *orderDetail;
@property (weak, nonatomic) IBOutlet UILabel *orderPrice;

@end

@implementation VIPOrderTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
