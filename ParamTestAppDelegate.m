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
    
    // change parameter value.  This seems like it could create confusion
    integerParameter += 1;
    NSLog(@"integerParameter = %d", integerParameter);
    
    integerParameter = 99;
    NSLog(@"integerParameter = %d", integerParameter);
    
    // error - 'integerParameter' redeclared as different kind of symbol
    // NSInteger integerParameter = 3;    
}


- (void)playWithObject
{
    NSObject* myObject = [[NSObject alloc] init];    
    NSLog(@"myObject = %@", myObject);
    
    [myObject release];
    myObject = nil;
}


- (void)playWithObjects
{
    // In Objective-C, objects are referenced by pointer values
    // "larry" is a pointer, its hex value is a memory address
    // larry points to an NSString
    NSString* larry = [[NSString alloc] initWithString:@"My name is Larry"];    
    NSLog(@"larry = \t\t %x \t description = %@", larry, larry);
 
    // "moe" is a pointer, points to an NSString
    NSString* moe = [[NSString alloc] initWithString:@"My name is Moe"];    
    NSLog(@"moe = \t\t\t %x \t description = %@", moe, moe);
    
    [moe release];
    moe = nil;
    NSLog(@"moe = \t\t\t %4x \t description = %@", moe, moe);
    
    moe = larry;
    NSLog(@"moe = \t\t\t %x \t description = %@", moe, moe);
 
    // "curly" is a pointer
    // we aren't allocating memory for an object, and don't need to release curly.
    NSString* curly = larry;   
    NSLog(@"curly = \t\t %x \t description = %@", curly, curly);    

    [larry release], larry = nil;
}


- (void)playWithObjectParameter:(NSObject*)anObject
{
    NSLog(@"anObject = \t %x \t description = %@", anObject, anObject);    
    
    // change parameter value.  This seems like it could create confusion
    anObject = @"Now I am serious";
    NSLog(@"anObject = \t %x \t description = %@", anObject, anObject);    
}


- (IBAction)handleGoButton:(id)sender
{
    [self playWithIntegerParameter:5];
    [self playWithObject];
    [self playWithObjects];

    NSString* sillyString = @"I'm a silly string";
    NSLog(@"sillyString = \t %x \t description = %@", sillyString, sillyString);    
    [self playWithObjectParameter:sillyString];
    NSLog(@"sillyString = \t %x \t description = %@", sillyString, sillyString);    
}

@end
