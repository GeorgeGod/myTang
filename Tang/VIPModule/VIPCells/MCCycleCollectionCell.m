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
    self.cycleBG.userInteractionEnabled = YES;
    self.cycleBG.contentMode = UIViewContentModeScaleAspectFit;
    self.cycleBG.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cycleBG.layer.shadowOpacity = 0.55;
    self.cycleBG.layer.shadowRadius = 10.f;
    self.cycleBG.layer.shadowOffset = CGSizeMake(0, 4);
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
    
    
    self.detail = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.detail setTitle:@"会员权益说明 >" forState:UIControlStateNormal];
    [self.detail setTitleColor:[UIColor colorWithHexString:@"#ECEEF5"] forState:UIControlStateNormal];
    self.detail.titleLabel.font = [UIFont font:12];
    self.detail.jk_touchAreaInsets = UIEdgeInsetsMake(10, 0, 10, 10);
    [self.contentView addSubview:self.detail];
    
    self.describe = [UILabel new];
    self.describe.text = @"*仅限于上海创智旗舰使用";
    self.describe.textColor = [UIColor colorWithHexString:@"#666666"];
    self.describe.font = [UIFont font:10];
    [self.contentView addSubview:self.describe];
}

-(void)initConstraints {
    UIView *superView = self.cycleBG;
    [self.cycleBG mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
        make.left.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
//        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
    }];
    [self.head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(superView).offset(20);
        make.top.mas_equalTo(superView).offset(10);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.head.mas_bottom).offset(57);
        make.left.mas_equalTo(superView).offset(20);
    }];
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.top.equalTo(self.title.mas_bottom);
    }];
    [self.describe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(superView).offset(20);
        make.bottom.equalTo(superView).offset(-10);
    }];
}
@end
