//
//  MemberCenterTipsCell.m
//  Tang
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberCenterTipsCell.h"
#import "UIFont+Extension.h"
#import "UIColor+Extension.h"
#import <Masonry.h>

@interface MemberCenterTipsCell()
@property (nonatomic, strong) UILabel *title;
@end

@implementation MemberCenterTipsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *label = [UILabel new];
        label.font = [UIFont RegularFont:12];
        label.numberOfLines = 0;
        label.textColor = [UIColor colorWithHexString:@"#999999"];
        self.title = label;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        }];
        
        //赋值
        [self assignmentWithText:nil];
    }
    return self;
}

-(void)assignmentWithText:(NSString *)txt {
    self.title.attributedText = [MemberCenterTipsCell obtainRichTextAttribute];
}

//private
+(NSMutableAttributedString *)obtainRichTextAttribute {
    NSString *p1 = @"开通InnoMaker会员后方可享有储物箱租用权；\n";
    NSString *p2 = @"储物箱使用期限不可超过InnoMaker会员到期期限，InnoMaker会员到期时，剩余的储物箱使用期限自动作废，请谨慎租用；\n";
    NSString *p3 = @"请自觉保持储物柜的干净、整洁、完好，若出现任何损坏，请及时告知管理员；\n";
    NSString *p4 = @"租用后，请联系客服人员领取储物箱钥匙\n";
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@", p1, p2, p3, p4];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#FC5D4D"] range:NSMakeRange(p1.length, p2.length)];
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 4.0;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    return attrStr;
}

+(CGFloat)obtainRichTextHeight {
    CGFloat width = [UIScreen mainScreen].bounds.size.width-40;
    NSMutableAttributedString *attrStr = [self obtainRichTextAttribute];
    CGSize size = [attrStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return size.height;
}

@end
