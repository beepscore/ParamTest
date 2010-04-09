//
//  ParamTestAppDelegate.m
//  ParamTest
//
//  Created by Steve Baker on 4/9/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "ParamTestAppDelegate.h"
#import "Debug.h"

@implementation ParamTestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}


- (void)playWithIntegerParameter:(NSInteger)integerParameter
{
    DLog(@"integerParameter = %5d", integerParameter);
    
    // change parameter value.  This seems like it could create confusion
    integerParameter += 1;
    DLog(@"integerParameter = %5d", integerParameter);
    
    integerParameter = 99;
    DLog(@"integerParameter = %5d", integerParameter);
    DLog();
    
    // error - 'integerParameter' redeclared as different kind of symbol
    // NSInteger integerParameter = 3;    
}


- (void)playWithObject
{
    NSObject* myObject = [[NSObject alloc] init];
    DLog(@"myObject is a pointer to an object.");
    DLog(@"myObject's value is the address where the object is stored.");
    DLog(@"myObject = %qx description = %@", myObject, myObject);
    DLog(@"myObject release and nil");
    [myObject release], myObject = nil;
    DLog(@"myObject = %9qx description = %@", myObject, myObject);
    DLog();
}

- (void)playWithString
{
    NSString* myString = @"Hello";    
    DLog(@"  myString = %qx description = %@", myString, myString);
    
    DLog(@"address where pointer value is stored");
    DLog(@" &myString = %qx", &myString);
    
    // dereference address to get back to myString.  myString == *&myString
    DLog(@"dereferenced address");
    DLog(@"*&myString = %qx description = %@", *&myString, *&myString);
    DLog();
}


- (void)playWithStrings
{
    // In Objective-C, objects are referenced by pointer values
    // "larry" is a pointer, its hex value is a memory address
    // larry points to an NSString
    NSString* larry = [[NSString alloc] initWithString:@"My name is Larry"];    
    DLog(@"larry = %qx description = %@", larry, larry);
 
    // "moe" is a pointer, points to an NSString
    NSString* moe = [[NSString alloc] initWithString:@"My name is Moe"];    
    DLog(@"  moe = %qx description = %@", moe, moe);
    
    DLog(@"moe release and nil");
    [moe release], moe = nil;
    DLog(@"  moe = %9qx description = %@", moe, moe);
    
    moe = larry;
    DLog(@"  moe = %qx description = %@", moe, moe);
 
    // "curly" is a pointer
    // we aren't allocating memory for an object, and don't need to release curly.
    NSString* curly = larry;   
    DLog(@"curly = %qx description = %@", curly, curly);  

    [larry release], larry = nil;
    DLog();
}


- (void)playWithObjectParameter:(NSObject*)anObject
{
    DLog(@"anObject = %qx description = %@", anObject, anObject);    
    
    // Re-assign parameter.
    anObject = @"Now I am serious";
    //   Now anObject points to a different address.
    DLog(@"anObject = %qx description = %@", anObject, anObject);    
}


- (IBAction)handleGoButton:(id)sender
{
    [self playWithIntegerParameter:5];
    [self playWithObject];
    [self playWithString];
    [self playWithStrings];

    NSString* sillyString = @"I'm a silly string";
    DLog(@"sillyString = \t\t %qx description = %@", sillyString, sillyString);    
    [self playWithObjectParameter:sillyString];
    DLog(@"sillyString = \t\t %qx description = %@", sillyString, sillyString);    
}

@end
