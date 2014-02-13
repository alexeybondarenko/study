//
//  CalendarGroupedCell.m
//  London
//
//  Created by Alexey Bondarenko on 2/13/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import "CalendarGroupedCell.h"
#import "CalendarSlideView.h"

@implementation CalendarGroupedCell

-(void)setup
{
    super.dataSource = self;
    super.delegate = self;
}

-(NSUInteger)numberOfSlides
{
    return [_data count];
}

-(UIView *)slideViewForCell:(SCSlidingCell *)cell withIndex:(NSUInteger)index andFrame:(CGRect)frame
{
    
//    UIView *view = [[UIView alloc] initWithFrame:frame]; view.backgroundColor = [UIColor colorWithRed:0.1+0.1*index green:0.3+0.05*index blue:0.2+0.15*index alpha:1.0]; return view;
    CalendarSlideView *calendarView = [[CalendarSlideView alloc] initWithFrame:frame];
    return calendarView;
}


@end
