//
//  CalendarSlideView.m
//  London
//
//  Created by Alexey Bondarenko on 2/13/14.
//  Copyright (c) 2014 Alexey Bondarenko. All rights reserved.
//

#import "CalendarSlideView.h"

@implementation CalendarSlideView

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

-(void) setup
{
    _textLabel.numberOfLines = 0;
    [_textLabel sizeToFit];
}
@end
