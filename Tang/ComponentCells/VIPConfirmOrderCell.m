//
//  VIPConfirmOrderCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPConfirmOrderCell.h"

@interface VIPConfirmOrderCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation VIPConfirmOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)assignmentCellWithData:(id)data {
    self.contentLabel.attributedText = [VIPConfirmOrderCell obtainContentAttributed:@"· 工具使用权\n· 储物箱租用权\n· 工作坊开发权\n· 专属课程福利\n· 参赛费用优惠\n· 专属兴趣小组"];
    self.dateLabel.attributedText = [VIPConfirmOrderCell obtainDateAttributed:@"购买后即日起生效，有效期至2017-07-31"];
}

/**
 获取整个cell的高度
 */
+(CGFloat)obtainCellHeight:(NSString *)content date:(NSString *)dateStr {
    //如果要修改top和lab的数值，同时一定要修改Xib中的约束
    float top1=14.5, top2=2, top3=10, bottom=14;
    float lab1=15;
    float contentH = [self obtainHeight:[self obtainContentAttributed:content]];
    float dateH = [self obtainHeight:[self obtainDateAttributed:dateStr]];
    return top1+lab1+top2+contentH+top3+dateH+bottom;
}

//private
+(float)obtainHeight:(NSAttributedString *)attrStr {
    float width = [UIScreen mainScreen].bounds.size.width-40;
    CGSize size = [attrStr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return size.height;
}

/**
 获取特权内容的富文本属性
 */
+(NSMutableAttributedString *)obtainContentAttributed:(NSString *)txt {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:txt];
    
    if (txt.length > 0) {
        NSRange range = NSMakeRange(0, txt.length);
        [attrStr addAttribute:NSFontAttributeName value:[UIFont lightFont:12] range:range];
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing = 3;
        [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:range];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#3F3F3F"] range:range];
    }
    return attrStr;
}
/**
 获取生效日期的富文本属性
 */
+(NSMutableAttributedString *)obtainDateAttributed:(NSString *)txt {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:txt];
    
    if (txt.length > 0) {
        NSRange range = NSMakeRange(0, txt.length);
        [attrStr addAttribute:NSFontAttributeName value:[UIFont lightFont:12] range:range];
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing = 4;
        [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:range];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#666666"] range:range];
    }
    return attrStr;
}


@end
