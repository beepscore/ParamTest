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
    DLog(@"integerParameter = %5ld", (long)integerParameter);
    
    // change parameter value.  This seems like it could create confusion
    integerParameter += 1;
    DLog(@"integerParameter = %5ld", (long)integerParameter);
    
    integerParameter = 99;
    DLog(@"integerParameter = %5ld", (long)integerParameter);
    DLog();
    
    // error - 'integerParameter' redeclared as different kind of symbol
    // NSInteger integerParameter = 3;    
}


// Ref http://www.cocoadev.com/index.pl?HowToUsePointers
- (void)changeIntegerAtAddress:(NSInteger *)aPointer
{
    DLog(@"aPointer points to address = %qx", aPointer);
    DLog(@"*aPointer = %d", *aPointer);
    *aPointer = 7;
    DLog(@"*aPointer = %d", *aPointer);
    DLog();
}


- (void)playWithObject
{
    // Ref http://forums.macrumors.com/showthread.php?t=625899
    NSObject* myObject = [[NSObject alloc] init];
    DLog(@"myObject is a pointer variable that points to an object.");
    DLog(@"myObject's value is the address where the object is stored.");
    DLog(@"myObject stored at address &myObject = %qx", &myObject);    
    DLog(@"myObject points to address = %qx", myObject);    
    DLog(@"myObject points to object with description = %@", myObject);    
    DLog(@"myObject release and nil");
    [myObject release], myObject = nil;
    DLog(@"myObject stored at address &myObject = %qx", &myObject);    
    DLog(@"myObject points to address = %qx", myObject);    
    DLog(@"myObject points to object with description = %@", myObject);    
    DLog();
}

- (void)playWithString
{
    NSString* myString = @"Hello";    
    DLog(@"myString stored at address &myString = %qx", &myString);    
    DLog(@"myString points to address = %qx", myString);    
    DLog(@"myString points to object with description = %@", myString);    

    // dereference address to get back to myString.  myString == *&myString
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
    // The calling message passed an argument.
    // Local parameter anObject points to the same address as the argument.     
    DLog(@"anObject stored at address &anObject = %qx", &anObject);    
    DLog(@"anObject points to address = %qx", anObject);    
    DLog(@"anObject points to object with description = %@", anObject);    
    
    // Re-assign parameter.  This doesn't change value of the calling message's argument.
    anObject = @"Now I am serious";
    // Now anObject points to a different address.
    DLog(@"anObject stored at address &anObject = %qx", &anObject);    
    DLog(@"anObject points to address = %qx", anObject);    
    DLog(@"anObject points to object with description = %@", anObject);    
    DLog();
}


- (void)playWithScopeOfParameter:(NSObject*)sillyString
{
    // The calling message passed an argument.
    // Local parameter sillyString points to the same address as the argument.     
    DLog(@"sillyString = %qx description = %@", sillyString, sillyString);    
    
    // Re-assign parameter.  This doesn't change value of the calling message's argument.
    sillyString = @"Now I am serious";
    // Now sillyString points to a different address.
    DLog(@"sillyString = %qx description = %@", sillyString, sillyString);    
    DLog();
}

# pragma mark UI
- (IBAction)handleIntegerFun:(id)sender
{
    [self playWithIntegerParameter:5];
}


- (IBAction)handleChangeIntegerFun:(id)sender
{
    NSInteger myInteger = 3;
    DLog(@"myInteger stored at address = %qx", &myInteger);
    DLog(@"myInteger = %d", myInteger);    
    
    [self changeIntegerAtAddress:&myInteger];
    
    // method changed the value of the argument
    DLog(@"myInteger = %d", myInteger);    
}



- (IBAction)handleObjectFun:(id)sender
{
    [self playWithObject];
}


- (IBAction)handleStringFun:(id)sender
{
    [self playWithString];
    [self playWithStrings];
}


- (IBAction)handleParameterFun:(id)sender
{
    NSString* sillyString = @"I'm a silly string";
    DLog(@"sillyString stored at address &sillyString = %qx", &sillyString);    
    DLog(@"sillyString points to address = %qx", sillyString);    
    DLog(@"sillyString points to object with description = %@", sillyString);    
    [self playWithObjectParameter:sillyString];
    // method did not change the value of the argument
    DLog(@"sillyString stored at address &sillyString = %qx", &sillyString);    
    DLog(@"sillyString points to address = %qx", sillyString);    
    DLog(@"sillyString points to object with description = %@", sillyString);    
    
    // send argument to receiver
    [self playWithScopeOfParameter:sillyString];
    // method did not change the value of the argument
    DLog(@"sillyString stored at address &sillyString = %qx", &sillyString);    
    DLog(@"sillyString points to address = %qx", sillyString);    
    DLog(@"sillyString points to object with description = %@", sillyString);    
}


@end
