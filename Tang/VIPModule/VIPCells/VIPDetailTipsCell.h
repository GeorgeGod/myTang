//
//  VIPDetailTipsCell.h
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIPDetailTipsCell : UITableViewCell

@property (nonatomic, strong) UILabel *title;

-(void)assignmentCellWithData:(NSString *)str;
/**
 计算行高
 
 @param str 数据源
 @return 返回cell的高度
 */
+(float)CalculateCellHeightWithData:(NSString *)str;

@end
