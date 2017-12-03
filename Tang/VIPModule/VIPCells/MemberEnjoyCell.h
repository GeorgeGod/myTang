//
//  MemberEnjoyCell.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberEnjoyCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

-(void)assignmentCellWithData:(NSArray *)dataArray;
@end

//privite
@interface MemberEnjoyCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *price;  //这个是储物箱模块的价格
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
-(void)assignmentCellWithData:(NSDictionary *)data;
@end
