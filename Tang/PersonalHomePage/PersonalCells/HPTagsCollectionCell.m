//
//  HPTagsCollectionCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPTagsCollectionCell.h"


@implementation HPTagsCollectionHeadView
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.title = [UILabel new];
        self.title.textColor = [UIColor colorWithHexString:@"#999999"];
        self.title.font = [UIFont lightFont:12];
        self.title.text = @"每类标签限选5个";
        [self addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 20, 0, 0));
        }];
    }
    return self;
}
@end





@implementation HPTagsCollectionCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tags = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tags setTitleColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateNormal];
        [self.tags setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateSelected];
        [self.tags jk_setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
        [self.tags jk_setBackgroundColor:[UIColor colorWithHexString:@"#222222"] forState:UIControlStateSelected];
        [self.tags.titleLabel setFont:[UIFont lightFont:14]];
        self.tags.layer.borderColor = [UIColor colorWithHexString:@"#B2B2B2"].CGColor;
        self.tags.layer.borderWidth = 0.5;
//        self.tags.enabled = NO;
        [self.contentView addSubview:self.tags];
        [self.tags mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}
@end
