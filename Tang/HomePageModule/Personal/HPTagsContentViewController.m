//
//  HPTagsContentViewController.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/2.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPTagsContentViewController.h"
#import <Masonry.h>
#import "UIView+Extension.h"
#import "HPPersonalTagsCell.h"
#import "HPTagsCollectionCell.h"

#import "HPAddTagsViewController.h"

@interface HPTagsContentViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSArray *constantArray;
    NSMutableArray *userDefinedArray;
    NSMutableArray *allDataArray;
    
    NSMutableArray *selectedArray;
}
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HPTagsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initData {
    if (self.currentPage == 0) {
        self.canAddUserTags = YES;
    } else {
        self.canAddUserTags = NO;
    }
    constantArray = @[@"程序员", @"设计师", @"产品经理", @"BD运营", @"投资",    @"财务", @"法务", @"人力资源", @"分析师", @"渠道", @"学生", @"学生", @"创业者", @"用户体验", @"房地产", @"市场营销", @"科技宅"];
    userDefinedArray = [NSMutableArray array];
    allDataArray = [NSMutableArray array];
    selectedArray = [NSMutableArray array];
    [allDataArray addObjectsFromArray:constantArray];
    
    if (self.canAddUserTags) {
        [userDefinedArray addObject:@"+自定义"];
    }
    [allDataArray addObjectsFromArray:userDefinedArray];
}

-(void)initView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = lineSpace;
    flowLayout.minimumInteritemSpacing = itemSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(insetT, insetL, insetB, insetR);
//    
//    flowLayout.minimumLineSpacing = 15;
//    flowLayout.minimumInteritemSpacing = 15;
//    float screenW = [UIScreen mainScreen].bounds.size.width;
//    float itemW = (screenW-20*2-3*15)/4;
//    flowLayout.itemSize = CGSizeMake(itemW, 30);
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.alwaysBounceVertical = YES;
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [collectionView registerClass:[HPTagsCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HPTagsCollectionHeadView"];
    [collectionView registerClass:[HPTagsCollectionCell class] forCellWithReuseIdentifier:@"HPTagsCollectionCell"];
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(collectionView.width, 37);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    float realW = [HPPersonalTagsCell calculateItemWidthWithTitle:allDataArray[row]];
    return CGSizeMake(realW, lineH);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HPTagsCollectionHeadView" forIndexPath:indexPath];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HPTagsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HPTagsCollectionCell" forIndexPath:indexPath];
    
    NSString *tag = allDataArray[indexPath.row];
    [cell.tags setTitle:tag forState:UIControlStateNormal];
    cell.tags.selected = [selectedArray containsObject:tag];
    
    
    cell.tags.tag = 1+indexPath.row;
    [cell.tags addTarget:self action:@selector(tagsButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return allDataArray.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tag = allDataArray[indexPath.row];
    if ([selectedArray containsObject:tag]) {
        [selectedArray removeObject:tag];
    } else {
        [selectedArray addObject:tag];
    }
    HPTagsCollectionCell *cell = (HPTagsCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.tags.selected = !cell.tags.isSelected;
}

-(void)tagsButtonAction:(UIButton *)sender {
    NSInteger row = sender.tag-1;
    NSLog(@"sender:%ld", row);
    if (self.canAddUserTags && (row == allDataArray.count-1)) {
        //选中的是"+自定义"
        HPAddTagsViewController *addTagsCtrl = [HPAddTagsViewController new];
        addTagsCtrl.title = @"自定义标签";
        __weak typeof(self)weakSelf = self;
        addTagsCtrl.inputComplete = ^(NSString * _Nullable inputStr) {
            [weakSelf addUserTag:inputStr];
        };
        [self pushViewCtrl:addTagsCtrl];
    } else {
        //选中的是标签
        NSString *tag = allDataArray[row];
        if ([selectedArray containsObject:tag]) {
            [selectedArray removeObject:tag];
        } else {
            [selectedArray addObject:tag];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        HPTagsCollectionCell *cell = (HPTagsCollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        cell.tags.selected = !cell.tags.isSelected;
    }
}


/**
 添加用户自定义标签
 
 @param tag 标签名称
 */
-(void)addUserTag:(NSString *)tag {
    //在倒数第二位插入新标签
    [userDefinedArray insertObject:tag atIndex:userDefinedArray.count-1];
    
    [allDataArray removeAllObjects];
    [allDataArray addObjectsFromArray:constantArray];
    [allDataArray addObjectsFromArray:userDefinedArray];
    [self.collectionView reloadData];
}

@end
