//
//  VIPDetailPriceCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailPriceCell.h"

@implementation VIPDetailPriceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    {
        UILabel *label = [UILabel new];
        label.text = @"包月VIP会员";
        label.font = [UIFont font:17];
        label.textColor = [UIColor colorWithHexString:@"#222222"];
        [self.contentView addSubview:label];
        self.title = label;
    }
    {
        UILabel *label = [UILabel new];
        label.text = @"¥199/月";
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont font:17];
        label.textColor = [UIColor colorWithHexString:@"#FC5D4D"];
        [self.contentView addSubview:label];
        self.price = label;
    }
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
    }];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
