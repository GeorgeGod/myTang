//
//  MineClassifyTableViewCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MineClassifyTableViewCell.h"
#import "UIImage+Path.h"
#import <Masonry.h>
#import "NSNumber+Extension.h"

@implementation MineClassifyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self initView];
}

-(void)initView {
    self.officelogo.image = [UIImage load:@"office"];
    self.orderlogo.image = [UIImage load:@"order"];
    self.friendslogo.image = [UIImage load:@"friends"];
    self.collectionlogo.image = [UIImage load:@"collection"];
    
    float logotop = 11;
    float titletop = 5;
    [self.officelogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scale(38));
        make.top.mas_equalTo(logotop);
    }];
    [self.officetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.officelogo);
        make.top.equalTo(self.officelogo.mas_bottom).offset(titletop);
    }];
    
    [self.orderlogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.officelogo.mas_right).offset(scale(43));
        make.top.mas_equalTo(logotop);
    }];
    [self.ordertitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.orderlogo);
        make.top.equalTo(self.orderlogo.mas_bottom).offset(titletop);
    }];
    
    [self.friendslogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ordertitle.mas_right).offset(scale(43));
        make.top.mas_equalTo(logotop);
    }];
    [self.friendstitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.friendslogo);
        make.top.equalTo(self.friendslogo.mas_bottom).offset(titletop);
    }];
    
    [self.collectionlogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.friendslogo.mas_right).offset(scale(43));
        make.top.mas_equalTo(logotop);
    }];
    [self.collectiontitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.collectionlogo);
        make.top.equalTo(self.collectionlogo.mas_bottom).offset(titletop);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
