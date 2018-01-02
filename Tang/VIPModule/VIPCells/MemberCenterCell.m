//
//  MemberCenterCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberCenterCell.h"
#import "UIColor+Extension.h"
#import <Masonry.h>
#import "NSNumber+Extension.h"
#import <JKCategories/JKCategories.h>
#import "MCCycleCollectionCell.h"

@interface MemberCenterCell()<UICollectionViewDelegate, UICollectionViewDataSource>
{
//    float imageW;  //图片宽度
    float itemS;  //间距
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageCtrl;
//@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MemberCenterCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self initData];
        
        [self initView];
    }
    return self;
}

//-(void)initData {
//    self.dataArray = @[@"", @"", @""];
//}

-(void)initView {
    itemS = 0;
//    imageW = 335;
    float screenW = [UIScreen mainScreen].bounds.size.width;
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = itemS;
    flowLayout.itemSize = CGSizeMake(screenW, 180); //CGSizeMake(imageW, 180);
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.scrollEnabled = NO;
    collectionView.pagingEnabled = YES;
    [self addSubview:collectionView];
    [collectionView registerClass:[MCCycleCollectionCell class] forCellWithReuseIdentifier:@"MCCycleCollectionCell"];
    collectionView.clipsToBounds = NO;
    self.collectionView = collectionView;
    
    UIPageControl *ctrl = [UIPageControl new];
    ctrl.numberOfPages = 3;
    ctrl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#222222" alpha:0.3];
    ctrl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#222222"];
    [self addSubview:ctrl];
    self.pageCtrl = ctrl;
    
    //布局
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(scale(30));
        make.left.right.equalTo(self);
        make.height.mas_equalTo(scale(180));
    }];
    [ctrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(collectionView.mas_bottom).offset(5);
    }];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MCCycleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MCCycleCollectionCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.title.text = @"VIP特权";
        cell.title.textColor = [UIColor colorWithHexString:@"#DAC293"];
        [cell.detail setTitleColor:[UIColor colorWithHexString:@"#DAC293"] forState:UIControlStateNormal];
        cell.detail.hidden = NO;
        cell.describe.hidden = YES;
    } else if (indexPath.row == 1) {
        cell.title.text = @"InnoMaker特权";
        cell.title.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
        [cell.detail setTitleColor:[UIColor colorWithHexString:@"#ECEEF5"] forState:UIControlStateNormal];
        cell.detail.hidden = NO;
        cell.describe.hidden = NO;
    } else {
        cell.title.text = @"InnoMaker储物箱";
        cell.title.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
        cell.detail.hidden = YES;
        cell.describe.hidden = YES;
    }
    [cell.detail jk_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        if (self.buttonClickedBlock) {
            self.buttonClickedBlock(nil);
        }
    }];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"--%f", scrollView.contentOffset.x);
//    int offsetX = (int)(scrollView.contentOffset.x / imageW);
//    if (offsetX >= 0 && offsetX < self.pageCtrl.numberOfPages) {
//        self.pageCtrl.currentPage = offsetX;
//        if (self.didEndScroll) {
//            self.didEndScroll(offsetX);
//        }
//    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self adjustPageScroll:scrollView];
    }
}

//滚动将要减速到停止
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self adjustPageScroll:scrollView];
}

//滚动将要开始减速
-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self adjustPageScroll:scrollView];
}



/**
 private 调整CollectionView的滚动
 */
-(void)adjustPageScroll:(UIScrollView *)scrollView {
//    CGPoint offset = scrollView.contentOffset;
//    int page = (int)(offset.x/imageW+0.5);
//    if (page > 2) {
//        page = 2;
//    }
//    if (page < 0) {
//        page = 0;
//    }
//    [scrollView setContentOffset:CGPointMake(imageW * page+itemS*(page-1),               scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
}

-(void)assignmentCellWithCurrentPage:(NSInteger)index {
    self.pageCtrl.currentPage = index;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        float screenW = [UIScreen mainScreen].bounds.size.width;
        [self.collectionView setContentOffset:CGPointMake(screenW*index, 0)];
    });
}

//-(void)pageCtrlValueChanged:(UIPageControl *)ctrl {
//    NSInteger page = ctrl.currentPage;
//    float screenW = [UIScreen mainScreen].bounds.size.width;
//    [self.collectionView setContentOffset:CGPointMake(screenW*page, 180)];
//}

@end
