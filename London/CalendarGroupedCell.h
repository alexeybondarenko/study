//
//  CalendarGroupedCell.h
//  London
//
//  Created by Alexey Bondarenko on 2/13/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import <SCSlidingCell/SCSlidingCell.h>

@interface CalendarGroupedCell : SCSlidingCell <SCSlidingCellDataSource, SCSlidingCellDelegate>

@property NSArray *data;

-(void)setup;

@end
