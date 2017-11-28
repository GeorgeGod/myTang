//
//  MineHeadTableViewCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MineHeadTableViewCell.h"

@implementation MineHeadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initView];
}

-(void)initView {
    
    self.portrail.image = [UIImage load:@"portrait"];
    self.vip.image = [UIImage load:@"vip"];
    self.maker.image = [UIImage load:@"maker"];
    self.line.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    
    [self.portrail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self.mas_top);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.portrail.mas_right).offset(18);
        make.top.mas_equalTo(10);
    }];
    
    [self.vip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.username.mas_right).offset(5);
        make.centerY.equalTo(self.username);
    }];
    
    [self.maker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vip.mas_right).offset(5);
        make.centerY.equalTo(self.username);
    }];
    
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.username);
        make.top.equalTo(self.username.mas_bottom).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    
    //未登录
    [self.loginbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.portrail.mas_right).offset(3);
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(64, 35));
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginbtn.mas_right);
        make.top.mas_equalTo(7);
        make.size.mas_equalTo(CGSizeMake(1, 24));
    }];
    [self.registerbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.line.mas_right);
        make.centerY.equalTo(self.loginbtn);
        make.size.equalTo(self.loginbtn);
    }];
}

-(void)setIslogin:(BOOL)islogin {
    self.loginbtn.hidden = islogin;
    self.line.hidden = islogin;
    self.registerbtn.hidden = islogin;
    
//    self.portrail.hidden = !islogin;
    self.username.hidden = !islogin;
    self.vip.hidden = !islogin;
    self.maker.hidden = !islogin;
    self.detail.hidden = !islogin;
    
    if (islogin) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
    } else {
        self.accessoryView = nil;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
