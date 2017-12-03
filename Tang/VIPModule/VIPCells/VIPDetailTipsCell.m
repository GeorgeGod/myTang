//
//  VIPDetailTipsCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailTipsCell.h"
#import "UIFont+Extension.h"
#import <Masonry.h>
#import "UIColor+Extension.h"

@implementation VIPDetailTipsCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    UILabel *label = [UILabel new];
    label.text = @"*开通会员后，所有特权立即生效，会员专属大礼包需要联系客服领取。\n会员权益同时只可购买一个月，需要当月权益过期后方可购买下一个月的权益。\n最终解释权归INNOSPACE+所有";
    label.numberOfLines = 0;
    label.font = [UIFont RegularFont:12];
    label.textColor = [UIColor colorWithHexString:@"#999999"];
    [self.contentView addSubview:label];
    self.title = label;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 20, 20, 20));
    }];
}

-(void)assignmentCellWithData:(NSString *)str {
    self.title.attributedText = [VIPDetailTipsCell obtainTipsAttributed:str];
}


/**
 计算行高
 
 @param str 数据源
 @return 返回cell的高度
 */
+(float)CalculateCellHeightWithData:(NSString *)str {
    NSMutableAttributedString *attrStr = [VIPDetailTipsCell obtainTipsAttributed:str];
    float screenW = [UIScreen mainScreen].bounds.size.width;
    CGSize size = [attrStr boundingRectWithSize:CGSizeMake(screenW-20*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return size.height+25;
}

+(NSMutableAttributedString *)obtainTipsAttributed:(NSString *)str {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont LightFont:12] range:NSMakeRange(0, str.length)];
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    return attrStr;
}

@end
