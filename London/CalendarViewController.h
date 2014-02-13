//
//  CalendarViewController.h
//  London
//
//  Created by Alexey Bondarenko on 2/12/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UITableViewController
{
    NSArray *data;
}

/** Data **/
@property NSArray *data;
-(void) initData;
-(NSUInteger) countOfGroupedCells;

/** Table view **/
-(void) configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
-(void) configureCalendarCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
-(void) configureDataCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

-(BOOL) isDataCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
-(BOOL) isCalendarCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
@end
