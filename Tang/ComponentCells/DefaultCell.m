//
//  DefaultCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "DefaultCell.h"

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
    self.textLabel.font = [UIFont font:15];
    
    self.detailTextLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.detailTextLabel.font = [UIFont font:14];
    
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage load:@"right_arrow"]];
}
@end
