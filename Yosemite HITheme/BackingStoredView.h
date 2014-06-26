//
//  BackingStoredView.h
//  Yosemite HITheme
//
//  Created by Dr. G. von D. on 6/26/14.
//  Copyright (c) 2014 Digia Qt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BackingStoredView : NSView

- (CGContextRef)setupBitmapContext;
- (void)drawBitmapContext:(CGContextRef)gc inRect:(CGRect)rect;

@end
