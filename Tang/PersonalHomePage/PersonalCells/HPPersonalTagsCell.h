//
//  HPPersonalTagsCell.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const float lineSpace; //行间距
extern const float itemSpace; //列间距
extern const int insetT;      //上缩进
extern const int insetL;      //左缩进
extern const int insetB;       //下缩进
extern const int insetR;      //右缩进
extern const int numRow;       //列数
extern const float lineH;     //行高


@interface HPPersonalTagsCell : UITableViewCell

-(void)assignmentCellWithData:(NSArray *)data;

/**
 private::根据标题长度计算实际宽度
 
 @param title 标题
 @return 返回实际的item的宽度
 */
+(float)calculateItemWidthWithTitle:(NSString *)title;

/**
 计算整个tableCell的高度
 
 @param data 数据源
 */
+(float)calculateCellHeightWithData:(NSArray *)data;

@end
