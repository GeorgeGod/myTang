//
//  VIPPrivilegeCell.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/3.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIPPrivilegeCell : UITableViewCell

-(void)assignmentCellWithData:(NSDictionary *)dataDic;


/**
 计算行高
 
 @param dataDic 数据源
 @return 返回cell的高度
 */
+(float)CalculateCellHeightWithData:(NSDictionary *)dataDic;
@end
