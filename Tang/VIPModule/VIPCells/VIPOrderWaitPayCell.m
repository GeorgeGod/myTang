//
//  VIPOrderWaitPayCell.m
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "VIPOrderWaitPayCell.h"
#import "UIImage+Path.h"

@interface VIPOrderWaitPayCell()
@property (weak, nonatomic) IBOutlet UIImageView *bannerBG;
@property (weak, nonatomic) IBOutlet UILabel *waitPay;
@property (weak, nonatomic) IBOutlet UILabel *lastTime;
@property (weak, nonatomic) IBOutlet UILabel *shouldPay;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

@implementation VIPOrderWaitPayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initView];
}

-(void)initView {
    self.bannerBG.image = [UIImage load:@"banner_waitpaybg"];
    
}

@end
