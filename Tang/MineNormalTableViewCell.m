//
//  MineNormalTableViewCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/28.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MineNormalTableViewCell.h"

@interface MineNormalTableViewCell() {
    UIView *reddot;
}
@end

@implementation MineNormalTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor colorWithHexString:@"#222222"];
        self.textLabel.font = [UIFont font:15];
        
        reddot = [UIView new];
        reddot.backgroundColor = [UIColor colorWithHexString:@"#FC5D4D"];
        reddot.layer.cornerRadius = 3;
        [self addSubview:reddot];
        [reddot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-30);
            make.centerY.equalTo(self);
            make.size.mas_offset(CGSizeMake(6, 6));
        }];
        
        //默认设置显示右箭头
        self.displayArrow = YES;
    }
    return self;
}

-(void)setUnread:(BOOL)unread {
    reddot.hidden = !unread;
}

-(void)setDisplayArrow:(BOOL)displayArrow {
    if (displayArrow) {
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
    } else {
        self.accessoryView = nil;
    }
}

@end
