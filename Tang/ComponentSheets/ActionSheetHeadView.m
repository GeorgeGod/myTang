//
//  ActionSheetHeadView.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ActionSheetHeadView.h"

@implementation ActionSheetHeadView

-(instancetype)initWithTitle:(NSString *)title leftBtn:(NSString *)left rightBtn:(NSString *)right {
    self = [super init];
    if (self) {
        
        UILabel *titleLable = [UILabel new];
        titleLable.text = title;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.textColor = [UIColor colorWithHexString:@"#222222"];
        titleLable.font = [UIFont font:15];
        [self addSubview:titleLable];
        
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        //左按钮
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setTitle:left forState:UIControlStateNormal];
        leftBtn.titleLabel.font = [UIFont font:15];
        [leftBtn setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
        __weak typeof(self)weakSelf = self;
        [leftBtn jk_addActionHandler:^(NSInteger tag) {
            if (weakSelf.buttonClickedBlock) {
                weakSelf.buttonClickedBlock(leftBtn);
            }
        }];
        [self addSubview:leftBtn];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.mas_equalTo(66);
        }];
        
        //分割线
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor colorWithHexString:@"#E2E2E2"];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

@end
