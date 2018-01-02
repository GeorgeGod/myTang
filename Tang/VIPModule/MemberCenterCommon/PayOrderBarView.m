//
//  PayOrderBarView.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PayOrderBarView.h"
#import "UIColor+Extension.h"
#import <Masonry.h>
#import "UIFont+Extension.h"
#import <JKCategories/JKCategories.h>

@implementation PayOrderBarView

+(instancetype)PayOrderBarView {
    
    PayOrderBarView *barView = [PayOrderBarView new];
    
    //分割线
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"#B2B2B2"];
    [barView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(barView);
        make.height.mas_equalTo(0.5);
    }];
    
    //取消订单
    UIButton *cancelOrder = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelOrder setTitle:@"取消订单" forState:UIControlStateNormal];
    cancelOrder.layer.borderColor = [UIColor colorWithHexString:@"#222222"].CGColor;
    cancelOrder.layer.borderWidth = 0.5;
    cancelOrder.titleLabel.font = [UIFont RegularFont:14];
    [cancelOrder setTitleColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    cancelOrder.showsTouchWhenHighlighted = YES;
    [barView addSubview:cancelOrder];
    [cancelOrder jk_addActionHandler:^(NSInteger tag) {
        if (barView.buttonClickedBlock) {
            barView.buttonClickedBlock(cancelOrder);
        }
    }];
    
    //去付款
    UIButton *pay = [UIButton buttonWithType:UIButtonTypeCustom];
    [pay setTitle:@"去付款" forState:UIControlStateNormal];
    pay.layer.borderColor = [UIColor colorWithHexString:@"#FC5D4D"].CGColor;
    pay.layer.borderWidth = 0.5;
    pay.titleLabel.font = [UIFont RegularFont:14];
    [pay setTitleColor:[UIColor colorWithHexString:@"#FC5D4D"] forState:UIControlStateNormal];
    pay.showsTouchWhenHighlighted = YES;
    [barView addSubview:pay];
    [pay jk_addActionHandler:^(NSInteger tag) {
        if (barView.buttonClickedBlock) {
            barView.buttonClickedBlock(pay);
        }
    }];
    
    [cancelOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(barView);
        make.right.equalTo(pay.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(82, 36));
    }];
    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(barView);
        make.right.equalTo(barView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(82, 36));
    }];
    return barView;
}

@end
