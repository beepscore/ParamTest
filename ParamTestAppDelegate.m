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
    DLog(@"myObject = %qx \t description = %@", myObject, myObject);
    DLog();
    
    [myObject release];
    myObject = nil;
}

- (void)playWithString
{
    NSString* myString = @"Hello";    
    DLog(@"myString = \t %qx \t description = %@", myString, myString);
    
    // address where pointer value is stored
    DLog(@"address where pointer value is stored &myString = %qx", &myString);
    // dereference address to get back to myString.  myString == *&myString
    DLog(@"dereferenced address *&myString = \t %qx \t description = %@", *&myString, *&myString);
    DLog();
}


- (void)playWithStrings
{
    // In Objective-C, objects are referenced by pointer values
    // "larry" is a pointer, its hex value is a memory address
    // larry points to an NSString
    NSString* larry = [[NSString alloc] initWithString:@"My name is Larry"];    
    DLog(@"larry = \t %qx \t description = %@", larry, larry);
 
    // "moe" is a pointer, points to an NSString
    NSString* moe = [[NSString alloc] initWithString:@"My name is Moe"];    
    DLog(@"moe = \t %qx \t description = %@", moe, moe);
    
    [moe release];
    moe = nil;
    DLog(@"moe = \t %9qx \t description = %@", moe, moe);
    
    moe = larry;
    DLog(@"moe = \t %qx \t description = %@", moe, moe);
 
    // "curly" is a pointer
    // we aren't allocating memory for an object, and don't need to release curly.
    NSString* curly = larry;   
    DLog(@"curly = \t %qx \t description = %@", curly, curly);    

    [larry release], larry = nil;
    DLog();
}


- (void)playWithObjectParameter:(NSObject*)anObject
{
    DLog(@"anObject = %qx \t description = %@", anObject, anObject);    
    
    // change parameter value.  This seems like it could create confusion
    anObject = @"Now I am serious";
    DLog(@"anObject = %qx \t description = %@", anObject, anObject);    
}


- (IBAction)handleGoButton:(id)sender
{
    [self playWithIntegerParameter:5];
    [self playWithObject];
    [self playWithString];
    [self playWithStrings];

    NSString* sillyString = @"I'm a silly string";
    DLog(@"sillyString = \t\t %qx \t description = %@", sillyString, sillyString);    
    [self playWithObjectParameter:sillyString];
    DLog(@"sillyString = \t\t %qx \t description = %@", sillyString, sillyString);    
}

@end
