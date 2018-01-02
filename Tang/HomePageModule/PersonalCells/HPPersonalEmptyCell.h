//
//  HPPersonalEmptyCell.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPPersonalEmptyCell : UITableViewCell
@property (nonatomic, strong) UIButton *addButton;
-(void)assignmentCellWithSection:(NSInteger)section;
@end
