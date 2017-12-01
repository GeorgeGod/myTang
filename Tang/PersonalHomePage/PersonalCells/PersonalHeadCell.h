//
//  PersonalHeadCell.h
//  Tang
//
//  Created by admin on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalHeadCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *phone;
@property (weak, nonatomic) IBOutlet UIImageView *portrait;
@property (weak, nonatomic) IBOutlet UIImageView *message;

@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UIButton *editInformationBtn;


@end
