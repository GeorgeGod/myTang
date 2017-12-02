//
//  HPPersonalTagsCell.m
//  Tang
//
//  Created by 虞嘉伟 on 2017/12/1.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "HPPersonalTagsCell.h"
#import "HPTagsCollectionCell.h"

const float lineSpace = 15; //行间距
const float itemSpace = 15; //列间距
const int insetT = 20;      //上缩进
const int insetL = 20;      //左缩进
const int insetB = 0;       //下缩进
const int insetR = 20;      //右缩进
const int numRow = 4;       //列数
const float lineH = 30;     //行高

@interface HPPersonalTagsCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *tagsArray;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation HPPersonalTagsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)assignmentCellWithData:(NSArray *)data {
    tagsArray = [NSMutableArray arrayWithArray:data];
}

-(void)initView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = lineSpace;
    flowLayout.minimumInteritemSpacing = itemSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(insetT, insetL, insetB, insetR);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.bounces = YES;
    self.collectionView = collectionView;
    [self.contentView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [collectionView registerClass:[HPTagsCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HPTagsCollectionHeadView"];
    [collectionView registerClass:[HPTagsCollectionCell class] forCellWithReuseIdentifier:@"HPTagsCollectionCell"];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    float realW = [HPPersonalTagsCell calculateItemWidthWithTitle:tagsArray[row]];
    return CGSizeMake(realW, lineH);
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HPTagsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HPTagsCollectionCell" forIndexPath:indexPath];
    
    NSString *tag = tagsArray[indexPath.row];
    [cell.tags setTitle:tag forState:UIControlStateNormal];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return tagsArray.count;
}

/**
 添加用户自定义标签
 
 @param tag 标签名称
 */
-(void)addUserTag:(NSString *)tag {
    [tagsArray addObject:tag];
//    //在倒数第二位插入新标签
//    [userDefinedArray insertObject:tag atIndex:userDefinedArray.count-1];
//
//    [allDataArray removeAllObjects];
//    [allDataArray addObjectsFromArray:constantArray];
//    [allDataArray addObjectsFromArray:userDefinedArray];
    [self.collectionView reloadData];
}


/**
 private::计算标准collection Item的宽度

 @return 返回标准宽度
 */
+(float)calculateStandardItemWidth {
    float screenW = [UIScreen mainScreen].bounds.size.width;
    float itemW = (screenW-insetL-insetR-(numRow-1)*itemSpace)/numRow;
    return itemW;
}

/**
 private::根据标题长度计算实际宽度

 @param title 标题
 @return 返回实际的item的宽度
 */
+(float)calculateItemWidthWithTitle:(NSString *)title {
    float realW = [title boundingRectWithSize:CGSizeMake(1000, 14) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont lightFont:14]} context:nil].size.width;
    float stdW = [self calculateStandardItemWidth];
    if (realW > stdW && realW <= 2*stdW) {
        return 2*stdW;
    } else if (realW > 2*stdW && realW <= 3*stdW) {
        return 3*stdW;
    } else {
        return stdW;
    }
}


/**
 计算整个tableCell的高度

 @param data 数据源
 */
+(float)calculateCellHeightWithData:(NSArray *)data {
    int more = 0;
    float stdW = [self calculateStandardItemWidth];
    for (NSString *str in data) {
        float realW = [self calculateItemWidthWithTitle:str];
        if (realW > stdW) {
            more++;
        }
    }
    
    NSInteger count = data.count + more;
    
    NSInteger row = ceilf(count/numRow);
    
    float totalH = (row-1)*lineSpace+lineH*row+insetT;
    return totalH;
}

@end
