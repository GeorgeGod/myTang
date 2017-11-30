//
//  VIPWaitPayViewController.h
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseTableViewController.h"

@interface VIPWaitPayViewController : BaseTableViewController

//二者选其一作为回调即可
@property (nonatomic, copy) ButtonClickedBackCtrlCallBack buttonClickedBlock;
@property (nonatomic, weak) id<DelegateCallBack>delegate;

@end
