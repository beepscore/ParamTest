//
//  ParamTestAppDelegate.h
//  ParamTest
//
//  Created by Steve Baker on 4/9/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ParamTestAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)handleIntegerFun:(id)sender;
- (IBAction)handleChangeIntegerFun:(id)sender;
- (IBAction)handleObjectFun:(id)sender;
- (IBAction)handleStringFun:(id)sender;
- (IBAction)handleParameterFun:(id)sender;

@end
