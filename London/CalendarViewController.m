//
//  CalendarViewController.m
//  London
//
//  Created by Alexey Bondarenko on 2/12/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import "CalendarViewController.h"

#import "CalendarGroupedCell.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

@synthesize data;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data
-(void)initData
{
    self.data = @[
                  @[@{@"name":@"Английский",@"location":@"203-26",@"task":@"Сделать перевод технического текста",@"date":[NSDate date]},@{@"name":@"Английский",@"location":@"203-26",@"task":@"Скачать англ песню  разобрать по словам",@"date":[NSDate date]}],
                  @[@{@"name":@"История",@"location":@"203-26",@"task":@"Культура ацтеков в отношении семьи и брака",@"date":[NSDate date]},@{@"name":@"История",@"location":@"203-26",@"task":@"Angry birds в культуре древнего востока",@"date":[NSDate date]},@{@"name":@"История",@"location":@"203-26",@"task":@"Влияние инструментов в развитии цивилизации античного периода",@"date":[NSDate date]}],
                  ];
}
-(NSUInteger)countOfGroupedCells
{
    return self.data.count;
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self isCalendarCell:nil withIndexPath:indexPath]) return 155;
    if ([self isDataCell:nil withIndexPath:indexPath]) return 90;
    
    return 44;
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            // first section with calendar view
            return 1;
            break;
        default:
            // other cell grouped by discipline name
            return self.countOfGroupedCells;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = (indexPath.section == 0) ? @"calendarCell" : @"groupedTaskCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // configuration cell
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell.reuseIdentifier];
    }
    
    if ([self isCalendarCell:nil withIndexPath:indexPath]) [self configureCalendarCell:cell forRowAtIndexPath:indexPath];
    if ([self isDataCell:nil withIndexPath:indexPath]) [self configureDataCell:cell forRowAtIndexPath:indexPath];
    
}
-(void)configureCalendarCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)configureDataCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarGroupedCell *groupedCell = (CalendarGroupedCell*)cell;
    groupedCell.data = [self.data objectAtIndex:indexPath.row];
    [groupedCell setup];
    
}
-(BOOL)isDataCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger dataCellSection = 1;
    return (indexPath.section == dataCellSection) ? YES : NO;
}
-(BOOL)isCalendarCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger calendarCellSection = 0;
    return (indexPath.section == calendarCellSection) ? YES : NO;
}

@end
