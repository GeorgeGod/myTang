//
//  PaymentBarView.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaymentBarView.h"

@interface PaymentBarView()
@property (nonatomic, strong) UILabel *priceLabel;
@end

@implementation PaymentBarView

+(instancetype)PaymentBarView {
    
    PaymentBarView *barView = [PaymentBarView new];
    
    //分割线
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor colorWithHexString:@"#B2B2B2"];
    [barView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(barView);
        make.height.mas_equalTo(0.5);
    }];
    
    //价格
    UILabel *price = [UILabel new];
    barView.priceLabel = price;
    price.text = @"应付：";
    [barView addSubview:price];
    
    //去付款
    UIButton *pay = [UIButton buttonWithType:UIButtonTypeCustom];
    [pay setTitle:@"去付款" forState:UIControlStateNormal];
    [pay jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    pay.showsTouchWhenHighlighted = YES;
    [barView addSubview:pay];
    [pay jk_addActionHandler:^(NSInteger tag) {
        if (barView.buttonClickedBlock) {
            barView.buttonClickedBlock(pay);
        }
    }];
    
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(barView);
        make.right.equalTo(pay.mas_left);
    }];
    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(barView);
        make.width.mas_equalTo(scale(145));
    }];
    return barView;
}

-(void)setPrice:(float)price {
    NSString *txtPrice = [NSString stringWithFormat:@"应付：¥%.2f", price];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:txtPrice];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#222222"] range:NSMakeRange(0, 3)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FC5D4D"] range:NSMakeRange(3, txtPrice.length-3)];
    
    self.priceLabel.attributedText = attrStr;
}

@end
