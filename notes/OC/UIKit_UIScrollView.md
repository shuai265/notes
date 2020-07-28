# API
1. 函数


2. 回调函数


```
# 停止滑动回调，用于调整滑动惯性停止位置，可用于自定义分页尺寸

/// @velocity: 滚动速度
/// @targetContentOffset: 目标停止位置
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
}

/// 应用一
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGPoint originalTargetContentOffset = CGPointMake(targetContentOffset->x, targetContentOffset->y);
    CGPoint targetCenter = CGPointMake(originalTargetContentOffset.x + CGRectGetWidth(self.collectionView.bounds)/2, CGRectGetHeight(self.collectionView.bounds) / 2);
    NSIndexPath *indexPath = nil;
    NSInteger i = 0;
    while (indexPath == nil) {
        targetCenter = CGPointMake(originalTargetContentOffset.x + CGRectGetWidth(self.collectionView.bounds)/2 + 10*i, CGRectGetHeight(self.collectionView.bounds) / 2);
        indexPath = [self.collectionView indexPathForItemAtPoint:targetCenter];
        i++;
    }
    self.selectedIndex = indexPath;
    //这里用attributes比用cell要好很多，因为cell可能因为不在屏幕范围内导致cellForItemAtIndexPath返回nil
    UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForItemAtIndexPath:indexPath];
    if (attributes) {
        *targetContentOffset = CGPointMake(attributes.center.x - CGRectGetWidth(self.collectionView.bounds)/2, originalTargetContentOffset.y);
    } else {
        DLog(@"center is %@; indexPath is {%@, %@}; cell is %@",NSStringFromCGPoint(targetCenter), @(indexPath.section), @(indexPath.item), attributes);
    }
}

/// 应用二
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    DDLog(@"scrollViewWillEndDragging %@, withVelocity.y %f, targetContentOffset->y %f",scrollView, velocity.y, targetContentOffset->y);
    CGFloat kCellHeight = 228;
    CGPoint originTargetPoint = {targetContentOffset->x, targetContentOffset->y};

    int upperCellCount = originTargetPoint.y/kCellHeight;
    CGFloat extraY = originTargetPoint.y - upperCellCount*kCellHeight;
    // TODO:: target count 需要增加保护，0 或 maxCount
    if (extraY >= 0.5 * kCellHeight) { // 滑动过半，显示下一个
        targetContentOffset->y = kCellHeight * (upperCellCount + 1);
    } else {
        targetContentOffset->y = kCellHeight * upperCellCount;
    }
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;//uncomment this for faster paging
}

```