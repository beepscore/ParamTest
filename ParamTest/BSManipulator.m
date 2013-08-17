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
