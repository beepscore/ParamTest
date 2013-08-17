//
//  BSManipulator.m
//  ParamTest
//
//  Created by Steve Baker on 8/17/13.
//
//  Manipulate method parameters to demonstrate Objective C object behavior.

#import "BSManipulator.h"

@implementation BSManipulator

- (NSInteger)incrementParameter:(NSInteger)anInteger {
    // increment parameter value.
    // This works, but seems like it could create confusion
    anInteger += 1;
    return anInteger;
}

// Ref http://www.cocoadev.com/index.pl?HowToUsePointers
- (void)changeIntegerAtAddressToSeven:(NSInteger *)aPointer {
    // aPointer points to a value of type NSInteger
    // below, '*' dereferences the pointer
    // set the value at the address aPointer points to
    *aPointer = 7;
}

/*

- (void)playWithString
{
    NSString* myString = @"Hello";
    NSLog(@"myString stored at address &myString = %qx", &myString);
    NSLog(@"myString points to address = %qx", myString);
    NSLog(@"myString points to object with description = %@", myString);

    // dereference address to get back to myString.  myString == *&myString
    NSLog(@"*&myString = %qx description = %@", *&myString, *&myString);
}


- (void)playWithStrings
{
    // In Objective-C, objects are referenced by pointer values
    // "larry" is a pointer, its hex value is a memory address
    // larry points to an NSString
    NSString* larry = [[NSString alloc] initWithString:@"My name is Larry"];
    NSLog(@"larry = %qx description = %@", larry, larry);

    // "moe" is a pointer, points to an NSString
    NSString* moe = [[NSString alloc] initWithString:@"My name is Moe"];
    NSLog(@"  moe = %qx description = %@", moe, moe);

    NSLog(@"moe nil");
    moe = nil;
    NSLog(@"  moe = %9qx description = %@", moe, moe);

    moe = larry;
    NSLog(@"  moe = %qx description = %@", moe, moe);

    // "curly" is a pointer
    // we aren't allocating memory for an object, and system doesn't need to release curly.
    NSString* curly = larry;
    NSLog(@"curly = %qx description = %@", curly, curly);

    larry = nil;
}


- (void)playWithObjectParameter:(NSObject*)anObject
{
    // The calling message passed an argument.
    // Local parameter anObject points to the same address as the argument.
    NSLog(@"anObject stored at address &anObject = %qx", &anObject);
    NSLog(@"anObject points to address = %qx", anObject);
    NSLog(@"anObject points to object with description = %@", anObject);

    // Re-assign parameter.  This doesn't change value of the calling message's argument.
    anObject = @"Now I am serious";
    // Now anObject points to a different address.
    NSLog(@"anObject stored at address &anObject = %qx", &anObject);
    NSLog(@"anObject points to address = %qx", anObject);
    NSLog(@"anObject points to object with description = %@", anObject);
}


- (void)playWithScopeOfParameter:(NSObject*)sillyString
{
    // The calling message passed an argument.
    // Local parameter sillyString points to the same address as the argument.
    NSLog(@"sillyString = %qx description = %@", sillyString, sillyString);

    // Re-assign parameter.  This doesn't change value of the calling message's argument.
    sillyString = @"Now I am serious";
    // Now sillyString points to a different address.
    NSLog(@"sillyString = %qx description = %@", sillyString, sillyString);
}
 
*/
@end
