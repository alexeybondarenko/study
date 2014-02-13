//
//  TestViewController.m
//  London
//
//  Created by Alexey Bondarenko on 2/13/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import "TestViewController.h"
#import "CalendarSlideView.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CalendarSlideView *calView = [[CalendarSlideView alloc] initWithFrame:CGRectMake(0, 10, 320, 90)];
    [self.view addSubview:calView];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
