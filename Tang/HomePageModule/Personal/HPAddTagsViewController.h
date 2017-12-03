//
//  HPAddTagsViewController.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BlockCallBack.h"

@interface HPAddTagsViewController : BaseTableViewController

@property (nonatomic, copy  ) NSString *tagStr; //记录输入框中的内容
@property (nonatomic, copy  ) inputCompleteBlock inputComplete;

@end
