//
//  VIPPrivilegeCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/3.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPPrivilegeCell.h"
#import <Masonry.h>
#import "UIImage+Path.h"
#import "UIFont+Extension.h"

@interface VIPPrivilegeCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *describe;

@end

@implementation VIPPrivilegeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void) modifyConstraintsWithDesribe:(BOOL)isDescribe {
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22);
        make.left.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [self.title mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.equalTo(self.icon.mas_right).offset(15);
    }];
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).offset(7);
        make.left.equalTo(self.title);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    if (isDescribe) {
        [self.describe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.top.equalTo(self.detail.mas_bottom).offset(10);
            make.right.equalTo(self.contentView).offset(-20);
        }];
    }
}

-(void)assignmentCellWithData:(NSDictionary *)dic {
    
    self.icon.image = [UIImage load:dic[@"icon"]];
    self.title.text = dic[@"title"];
    self.detail.attributedText = [VIPPrivilegeCell obtainDetailAttributed:dic[@"detail"]];
    
    if ([dic objectForKey:@"describe"]) {
        self.describe.attributedText = [VIPPrivilegeCell obtainDescribeAttributed:dic[@"describe"]];
        self.describe.hidden = NO;
        [self modifyConstraintsWithDesribe:YES];
    } else {
        self.describe.hidden = YES;
        [self modifyConstraintsWithDesribe:NO];
    }
    
}


+(NSMutableAttributedString *)obtainDetailAttributed:(NSString *)str {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    if (!str || str.length == 0) {
        return attrStr;
    }
    [attrStr addAttribute:NSFontAttributeName value:[UIFont LightFont:12] range:NSMakeRange(0, str.length)];
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 5;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    return attrStr;
}

+(NSMutableAttributedString *)obtainDescribeAttributed:(NSString *)str {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont LightFont:10] range:NSMakeRange(0, str.length)];
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = 2;
    [attrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    return attrStr;
}

/**
 计算文本高度
 
 @param attrStr 数据源
 @return 返回富文本的高度
 */
+(float)CalculateTextHeightWithAttributed:(NSMutableAttributedString *)attrStr {
    float screenW = [UIScreen mainScreen].bounds.size.width;
    CGSize size = [attrStr boundingRectWithSize:CGSizeMake(screenW-85-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return size.height;
}


/**
 计算行高

 @param dataDic 数据源
 @return 返回cell的高度
 */
+(float)CalculateCellHeightWithData:(NSDictionary *)dataDic {
    float cellH = 0;
    //记录上边距的高度
    float top1=30, top2=7, top3=12;
    //记录最后一个下边距
    float bot1 = 20, bot2 = 27;
    //标题文字的高度
    float h1 = 15;
    //计算详情和描述的富文本高度
    float d1=0, d2=0;
    NSMutableAttributedString *attrStr1 = [VIPPrivilegeCell obtainDetailAttributed:dataDic[@"detail"]];
    d1 = [VIPPrivilegeCell CalculateTextHeightWithAttributed:attrStr1];
    if ([dataDic objectForKey:@"describe"]) {
        //描述不为空
//        NSMutableAttributedString *attrStr2 = [VIPPrivilegeCell obtainDetailAttributed:dataDic[@"describe"]];
//        d2 = [VIPPrivilegeCell CalculateTextHeightWithAttributed:attrStr2];
        d2 = ([UIScreen mainScreen].bounds.size.width == 320) ? 112 : 84;
        cellH = top1+h1+top2+d1+top3+d2+bot1;
    } else {
        //描述为空
        cellH = top1+h1+top2+d1+bot2;
    }
    return cellH;
}

@end
