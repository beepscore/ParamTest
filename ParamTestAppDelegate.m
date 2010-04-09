//
//  ParamTestAppDelegate.m
//  ParamTest
//
//  Created by Steve Baker on 4/9/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "ParamTestAppDelegate.h"

@implementation ParamTestAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
}

- (void)playWithIntegerParameter:(NSInteger)integerParameter
{
    NSLog(@"integerParameter = %d", integerParameter);
}

- (IBAction)handleGoButton:(id)sender
{
    [self playWithIntegerParameter:5];
}

@end
