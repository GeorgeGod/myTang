//
//  DefaultCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "DefaultCell.h"
#import "UIFont+Extension.h"
#import "UIColor+Extension.h"
#import "UIImage+Path.h"

@implementation DefaultCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initView];
    }
    return self;
}

-(void)initView {
    self.textLabel.textColor = [UIColor colorWithHexString:@"#222222"];
    self.textLabel.font = [UIFont RegularFont:15];
    
    self.detailTextLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.detailTextLabel.font = [UIFont RegularFont:14];
    
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
}
@end
