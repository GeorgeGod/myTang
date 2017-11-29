//
//  VIPDetailDiscountCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPDetailDiscountCell.h"

@implementation VIPDetailDiscountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initView];
}

-(void)initView {
    self.logo.image = [UIImage load:@"icon_discount"];
}

@end
