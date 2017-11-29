//
//  MCCycleCollectionCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MCCycleCollectionCell.h"

@interface MCCycleCollectionCell()

@end

@implementation MCCycleCollectionCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        
        [self initConstraints];
    }
    return self;
}

-(void)initView {
    self.cycleBG = [[UIImageView alloc] initWithImage:[UIImage load:@"innoMaker_bg"]];
    self.cycleBG.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.cycleBG];
    
    self.head = [UILabel new];
    self.head.text = @"加入INNO会员  尊享豪礼特权";
    self.head.textColor = [UIColor colorWithHexString:@"#666666"];
    self.head.font = [UIFont font:17];
    [self.contentView addSubview:self.head];
    
    self.title = [UILabel new];
    self.title.text = @"InnoMaker特权";
    self.title.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
    self.title.font = [UIFont font:30];
    [self.contentView addSubview:self.title];
    
    
    self.detail = [UILabel new];
    self.detail.text = @"会员权益说明 >";
    self.detail.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
    self.detail.font = [UIFont font:12];
    [self.contentView addSubview:self.detail];
    
    self.describe = [UILabel new];
    self.describe.text = @"*仅限于上海创智旗舰使用";
    self.describe.textColor = [UIColor colorWithHexString:@"#666666"];
    self.describe.font = [UIFont font:10];
    [self.contentView addSubview:self.describe];
}

-(void)initConstraints {
    [self.cycleBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    [self.head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.head.mas_bottom).offset(57);
        make.left.mas_equalTo(20);
    }];
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.top.equalTo(self.title.mas_bottom);
    }];
    [self.describe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}
@end
