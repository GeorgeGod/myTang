//
//  VIPConfirmOrderCell.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIPConfirmOrderCell : UITableViewCell

+(CGFloat)obtainCellHeight:(NSString *)content date:(NSString *)dateStr;

-(void)assignmentCellWithData:(id)data;

@end
