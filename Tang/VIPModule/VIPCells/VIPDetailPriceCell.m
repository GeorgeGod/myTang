//
//  VIPDetailPriceCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailPriceCell.h"
#import "UIFont+Extension.h"
#import "UIColor+Extension.h"
#import <Masonry.h>
#import "UIImage+Path.h"

@implementation VIPDetailPriceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    self.viplogo = [UIImageView new];
    [self.contentView addSubview:self.viplogo];
    
    {
        UILabel *label = [UILabel new];
        label.text = @"包月VIP会员";
        label.font = [UIFont RegularFont:17];
        label.textColor = [UIColor colorWithHexString:@"#222222"];
        [self.contentView addSubview:label];
        self.title = label;
    }
    {
        UILabel *label = [UILabel new];
        label.text = @"¥199/月";
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont RegularFont:17];
        label.textColor = [UIColor colorWithHexString:@"#FC5D4D"];
        [self.contentView addSubview:label];
        self.price = label;
    }
    
    [self.viplogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self.contentView);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viplogo.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
    }];
}

-(void)assignmentCellWithData:(NSDictionary *)dataDic {
    self.title.text = dataDic[@"title"];
    self.price.text = dataDic[@"price"];
    
    if ([dataDic objectForKey:@"desc"]) {
        self.describe.text = dataDic[@"desc"];
        //更新一下布局
    }
    if ([dataDic objectForKey:@"icon"]) {
        self.viplogo.image = [UIImage load:dataDic[@"icon"]];
        //更新一下布局
        
    }
}

@end
