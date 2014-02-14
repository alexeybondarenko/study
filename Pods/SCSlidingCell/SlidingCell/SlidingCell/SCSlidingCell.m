//
//  SCSlidingCellView.m
//  SlidingCell
//
//  Created by Alexey Bondarenko on 2/12/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import "SCSlidingCell.h"

@implementation SCSlidingCell
{
    UIView *scrollViewContentView;
}
@synthesize dataSource, delegate, scrollView, pageControl;

-(id)init
{
    if (self = [super init]) {
        [self initAdditionalView];
    }
    return self;
    
}
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initAdditionalView];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initAdditionalView];
    }
    return self;
}

- (void)reloadSlides {
    [[scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [scrollView setContentSize:CGSizeMake(0, 0)];
    
    [self initSlides];
}
- (void)initAdditionalView {
    
    self.alignment = SCSlidingCellViewAligmentLeft;
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.delegate = self;
    scrollView.clipsToBounds = YES;
    scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    [scrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    [[self contentView] addSubview:scrollView];
    
    [self initSlides];
}

- (void)initSlides {
    
    NSUInteger kCount = [dataSource numberOfSlides];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    
    for (NSUInteger idx=0; idx< kCount; idx++) {
        
        UIView *view = [dataSource slideViewForCell:self withIndex:idx andFrame:self.bounds];
        view.backgroundColor = [UIColor whiteColor];
        
        CGSize prevSize = scrollView.contentSize;
        CGSize newSize = prevSize;

        newSize.width += view.bounds.size.width;
        CGRect viewFrame = CGRectMake(prevSize.width, 0, view.bounds.size.width, view.bounds.size.height);
        view.frame = viewFrame;

        [scrollView setContentSize:newSize];
        [scrollView addSubview:view];
        
        [tempArray addObject:view];
    }
    self.views = [tempArray copy];
}

-(void)bounceEndingScrolling
{
    CGPoint endpoint = scrollView.contentOffset;
    
    __block NSUInteger maxId = 0;
    __block float kMaxVisibleWidth = 0;
    __block float scrollViewWidth = scrollView.bounds.size.width;
    
    [self.views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        
        float kVisibleWidth = view.bounds.size.width;
        
        float minX = view.frame.origin.x - endpoint.x;
        float maxX = minX + view.frame.size.width;
        
        if (minX < 0)
            kVisibleWidth += minX;
        if (maxX > scrollViewWidth)
            kVisibleWidth -= maxX - scrollViewWidth;
        
        if (kVisibleWidth > kMaxVisibleWidth) {
            kMaxVisibleWidth = kVisibleWidth;
            maxId = idx;
        }
    }];
    UIView *visibleView = (UIView*)self.views[maxId];
    
    CGPoint offsetPoint = visibleView.frame.origin;
    
    if (self.alignment == SCSlidingCellViewAligmentCenter) {
        offsetPoint.x += visibleView.frame.size.width/2;
        offsetPoint.x -= scrollView.bounds.size.width/2;
    }
    if (self.alignment == SCSlidingCellViewAligmentRight) {
        offsetPoint.x += visibleView.frame.size.width;
        offsetPoint.x -= scrollView.bounds.size.width;
    }
    //blank space from left
    if (offsetPoint.x < 0) offsetPoint.x = 0;
    //blank space from right
    if ((offsetPoint.x + scrollViewWidth) > scrollView.contentSize.width) offsetPoint.x -= (offsetPoint.x + scrollViewWidth) - scrollView.contentSize.width;
    
    [scrollView setContentOffset:offsetPoint animated:YES];
    
    if ([delegate respondsToSelector:@selector(slidingCell:didSelectedView:)]) {
        [delegate slidingCell:self didSelectedView:visibleView];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self bounceEndingScrolling];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self bounceEndingScrolling];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
