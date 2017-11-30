//
//  VIPOrderTipsCell.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPOrderTipsCell.h"

@interface VIPOrderTipsCell()
@property (nonatomic, strong) UILabel *orderNum;
@property (nonatomic, strong) UILabel *orderDate;
@property (nonatomic, strong) UIButton *orderNumCopyBtn;
@end

@implementation VIPOrderTipsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}


-(void)initView {
    //创建订单号
    UILabel *num = [UILabel new];
    num.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
    num.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
    self.orderNum = num;
    [self.contentView addSubview:num];
    
    //创建订单日期
    UILabel *date = [UILabel new];
    date.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
    date.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
    self.orderDate = date;
    [self.contentView addSubview:date];

    //创建复制按钮
    UIButton *copy = [UIButton buttonWithType:UIButtonTypeCustom];
    copy.layer.borderColor = [UIColor colorWithHexString:@"#B2B2B2"].CGColor;
    copy.layer.borderWidth = 0.5;
    [copy setTitle:@"复制" forState:UIControlStateNormal];
    copy.showsTouchWhenHighlighted = YES;
    copy.titleLabel.font = [UIFont font:12];
    [copy setTitleColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
    [copy addTarget:self action:@selector(copyOrderAction) forControlEvents:UIControlEventTouchUpInside];
    self.orderNumCopyBtn = copy;
    [self.contentView addSubview:copy];
    
    [num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(14);
    }];
    [date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(num);
        make.top.equalTo(num.mas_bottom).offset(10);
    }];
    [copy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(56, 22));
        make.centerY.equalTo(num);
    }];
}

-(void)copyOrderAction {
    NSString *orderTxt = self.orderNum.text;
    NSRange range1 = [orderTxt rangeOfString:@"订单号："];
    if (range1.location != NSNotFound) {
        NSString *orderNum = [orderTxt substringFromIndex:(range1.location+range1.length)];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = orderNum;
    }
}

-(void)assignmentCellWithData:(id)data {
    self.orderNum.text = @"订单号：12348766";
    self.orderDate.text = @"下单时间：2017-07-21";
}
@end
