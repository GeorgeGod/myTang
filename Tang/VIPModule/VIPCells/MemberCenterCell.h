//
//  MemberCenterCell.h
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberCenterCell : UITableViewCell

@property (nonatomic, copy  ) scrollBlock didEndScroll;
@property (nonatomic, copy  ) ButtonClickedCallBack buttonClickedBlock;

-(void)assignmentCellWithCurrentPage:(NSInteger)index;
@end
