//
//  HIThemeFocusRectView.m
//  Yosemite HITheme
//
//  Created by Gabriel de Dietrich on 25/06/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import "HIThemeFocusRectView.h"
#import <HIToolbox/HIToolbox.h>


@implementation HIThemeFocusRectView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    CGContextRef cg = [[NSGraphicsContext currentContext] graphicsPort];
    HIRect rect = CGRectInset(self.bounds, 6, 6);

    HIThemeDrawFocusRect(&rect, true, cg, kHIThemeOrientationNormal);
}

@end
