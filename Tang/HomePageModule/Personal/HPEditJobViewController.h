//
//  HPEditJobViewController.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BlockCallBack.h"

@interface HPEditJobViewController : BaseTableViewController

@property (nonatomic, copy  ) NSString *jobStr; //记录输入框中的内容
@property (nonatomic, copy  ) inputCompleteBlock inputComplete;

@end
