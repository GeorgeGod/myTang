//
//  HPTagsContentViewController.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseViewController.h"

@interface HPTagsContentViewController : BaseViewController

//标记当前是第几页
@property (nonatomic, assign) NSInteger currentPage;

//能否添加自定义标签
@property (nonatomic, assign) BOOL canAddUserTags;

@end
