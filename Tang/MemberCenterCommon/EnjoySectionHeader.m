//
//  EnjoySectionHeader.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "EnjoySectionHeader.h"

@interface EnjoySectionHeader()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation EnjoySectionHeader

+(instancetype)EnjoySectionHeader {
    EnjoySectionHeader *headView = [EnjoySectionHeader EnjoySectionHeaderWithTitle:@"开通即可享有"];
    
    return headView;
}

+(instancetype)EnjoySectionFooter {
    EnjoySectionHeader *footView = [EnjoySectionHeader EnjoySectionHeaderWithTitle:@"注意事项"];
    
    return footView;
}


//private
+(instancetype)EnjoySectionHeaderWithTitle:(NSString *)txt {
    //创建容器view
    EnjoySectionHeader *headView = [EnjoySectionHeader new];
    
    //左分割线
    UIView *leftline = [UIView new];
    leftline.backgroundColor = [UIColor colorWithHexString:@"#E2E2E2"];
    [headView addSubview:leftline];
    
    //标题
    UILabel *title = [UILabel new];
    title.text = txt;
    title.textColor = [UIColor colorWithHexString:@"#999999"];
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont font:15];
    headView.titleLabel = title;
    [headView addSubview:title];
    
    //右分割线
    UIView *rightline = [UIView new];
    rightline.backgroundColor = [UIColor colorWithHexString:@"#E2E2E2"];
    [headView addSubview:rightline];
    
    //布局
    [leftline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scale(53));
        make.width.mas_equalTo(scale(70));
        make.height.mas_equalTo(0.5);
        make.centerY.equalTo(title);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headView);
    }];
    [rightline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headView).offset(scale(-53));
        make.width.mas_equalTo(scale(70));
        make.height.mas_equalTo(0.5);
        make.centerY.equalTo(title);
    }];
    
    return headView;
}
@end
