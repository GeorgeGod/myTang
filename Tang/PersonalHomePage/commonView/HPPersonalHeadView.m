//
//  HPPersonalHeadView.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPPersonalHeadView.h"

@implementation HPPersonalHeadView

+(instancetype)HeadView {
    HPPersonalHeadView *headView = [HPPersonalHeadView new];
    headView.backgroundColor = [UIColor whiteColor];
    
    //标题
    UILabel *title = [UILabel new];
    title.textColor = [UIColor colorWithHexString:@"#222222"];
    title.font = [UIFont mediumFont:17];
    headView.title = title;
    [headView addSubview:title];
    
    //按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHexString:@"#4B9FED"] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont font:14]];
    btn.showsTouchWhenHighlighted = YES;
    [btn jk_setImagePosition:LXMImagePositionLeft spacing:4];
    headView.button = btn;
    [headView addSubview:btn];
    
    //布局
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.left.mas_equalTo(20);
        make.bottom.equalTo(headView);
        make.height.mas_equalTo(24);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headView).offset(-20);
        make.centerY.equalTo(title);
    }];
    return headView;
}

+(instancetype)HeadViewTag:(NSInteger)tag withButtonTitle:(NSString *)title {
    HPPersonalHeadView *headView = [HPPersonalHeadView HeadView];
    headView.title.text = title;
    headView.button.tag = tag;
    if ([title isEqualToString:@"项目"]) {
        headView.button.hidden = YES;
    } else if ([title isEqualToString:@"教育"]) {
        headView.button.hidden = NO;
        [headView.button setImage:[UIImage load:@"icon_mine_add"] forState:UIControlStateNormal];
    } else {
        headView.button.hidden = NO;
        [headView.button setImage:[UIImage load:@"icon_mine_edit"] forState:UIControlStateNormal];
    }
    return headView;
}
@end
