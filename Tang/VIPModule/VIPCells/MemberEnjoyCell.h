//
//  MemberEnjoyCell.h
//  Tang
//
//  Created by admin on 2017/11/30.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberEnjoyCell : UITableViewCell <UICollectionViewDelegate, UICollectionViewDataSource>

@end

//privite
@interface MemberEnjoyCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
-(void)assignmentCellWithData:(NSDictionary *)data;
@end
