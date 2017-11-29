//
//  MemberCenterCell.m
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MemberCenterCell.h"
#import "MCCycleCollectionCell.h"

@interface MemberCenterCell()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageCtrl;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MemberCenterCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initData];
        
        [self initView];
    }
    return self;
}

-(void)initData {
    self.dataArray = @[@"", @"", @""];
}

-(void)initView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 13;
    flowLayout.itemSize = CGSizeMake(335, 180);
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 20, 30, 20);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:collectionView];
    [collectionView registerClass:[MCCycleCollectionCell class] forCellWithReuseIdentifier:@"MCCycleCollectionCell"];
    self.collectionView = collectionView;
    
    UIPageControl *ctrl = [UIPageControl new];
    ctrl.numberOfPages = 3;
    ctrl.currentPage = 0;
    ctrl.pageIndicatorTintColor = [UIColor colorWithHexString:@"#222222" alpha:0.3];
    ctrl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#222222"];
    [self addSubview:ctrl];
    self.pageCtrl = ctrl;
    
    //布局
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(180);
    }];
    [ctrl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(collectionView.mas_bottom).offset(20);
    }];
}



- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MCCycleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MCCycleCollectionCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.title.text = @"VIP特权";
        cell.title.textColor = [UIColor colorWithHexString:@"#DAC293"];
        cell.detail.textColor = [UIColor colorWithHexString:@"#DAC293"];
        cell.detail.hidden = NO;
        cell.describe.hidden = YES;
    } else if (indexPath.row == 1) {
        cell.title.text = @"InnoMaker特权";
        cell.title.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
        cell.detail.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
        cell.detail.hidden = NO;
        cell.describe.hidden = NO;
    } else {
        cell.title.text = @"InnoMaker储物箱";
        cell.title.textColor = [UIColor colorWithHexString:@"#ECEEF5"];
        cell.detail.hidden = YES;
        cell.describe.hidden = YES;
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"--%f", scrollView.contentOffset.x);
    int offsetX = (int)(scrollView.contentOffset.x / self.width);
    if (offsetX > 0 && offsetX < self.pageCtrl.numberOfPages) {
        self.pageCtrl.currentPage = offsetX;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        CGPoint offset = scrollView.contentOffset;
        int page = (int)((offset.x+335/2.0)/335.0);
        
        [scrollView setContentOffset:CGPointMake(335 * page+13*page,               scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
    }
}


//滚动将要减速到停止
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    int page = (int)((offset.x+335/2.0)/335.0);
    
    [scrollView setContentOffset:CGPointMake(335 * page+13*page,               scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
}

//滚动将要开始减速
-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    int page = (int)((offset.x+335/2.0)/335.0);
    
    [scrollView setContentOffset:CGPointMake(335 * page+13*page,               scrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面

}

@end
