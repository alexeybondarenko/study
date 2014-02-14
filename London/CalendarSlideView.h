//
//  CalendarSlideView.h
//  London
//
//  Created by Alexey Bondarenko on 2/13/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import <UIView+NibLoading/UIView+NibLoading.h>

@interface CalendarSlideView : NibLoadedView

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *textLabel;

@end
