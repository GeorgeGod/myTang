//
//  HPTagsCollectionCell.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 标签的sectionHead
 */
@interface HPTagsCollectionHeadView : UICollectionReusableView
@property (nonatomic, strong) UILabel *title;
@end


/**
 标签的cell
 */
@interface HPTagsCollectionCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *tags;
@end
