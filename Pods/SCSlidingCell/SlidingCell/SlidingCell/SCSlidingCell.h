//
//  SCSlidingCellView.h
//  SlidingCell
//
//  Created by Alexey Bondarenko on 2/12/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    SCSlidingCellViewAligmentLeft,
    SCSlidingCellViewAligmentCenter,
    SCSlidingCellViewAligmentRight
} SCSlidingCellViewAlignment;

@class SCSlidingCell;
/** Declaration SCSlidingCellView delegate protocol **/

@protocol SCSlidingCellDataSource

// method return count of slides in the current sliding cell
-(NSUInteger) numberOfSlides;
// view for slide at index.
-(UIView *) slideViewForCell:(SCSlidingCell *)cell withIndex:(NSUInteger) index andFrame:(CGRect) frame;

@end

@protocol SCSlidingCellDelegate <NSObject>

@optional
-(void) slidingCell:(SCSlidingCell *)slidingCell didSelectedView:(UIView *)view;

@end

@interface SCSlidingCell : UITableViewCell <UIScrollViewDelegate>
{
    id <SCSlidingCellDelegate> delegate;
    id <SCSlidingCellDataSource> dataSource;
}
@property id <SCSlidingCellDelegate> delegate;
@property id <SCSlidingCellDataSource> dataSource;
@property SCSlidingCellViewAlignment alignment;

@property UIScrollView *scrollView;

@property UIPageControl *pageControl;

@property NSArray *views;

// Start creating additional views and slides
-(void) reloadSlides;

// Initing scrollView and pageControl to provide sliding functionality
-(void) initAdditionalView;

// adding slides views in the scroll view
-(void) initSlides;

-(void) bounceEndingScrolling;

@end
