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

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.dataSource = self;
    self.delegate = self;
}

-(NSUInteger)numberOfSlides
{
    return [_data count];
}

-(UIView *)slideViewForCell:(SCSlidingCell *)cell withIndex:(NSUInteger)index andFrame:(CGRect)frame
{
    CalendarSlideView *calendarView = [[CalendarSlideView alloc] init];
    //@{@"name":@"Английский",@"location":@"203-26",@"task":@"Сделать перевод технического текста",@"date":[NSDate date]}
    NSDictionary *slideDict = (NSDictionary*)self.data[index];
    calendarView.nameLabel.text = [slideDict objectForKey:@"name"];
    calendarView.textLabel.text = [slideDict objectForKey:@"task"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterShortStyle];
    NSString *stringFromDate = [formatter stringFromDate:[NSDate date]];
    
    calendarView.dateLabel.text = stringFromDate;
    return calendarView;
}

-(void)slidingCell:(SCSlidingCell *)slidingCell didSelectedView:(UIView *)view
{
    NSLog(@"was selected slide %@", view);
}
@end
