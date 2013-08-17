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
    // this changes the value within the caller's scope
    *aPointer = 7;
}


- (NSObject *)reassignParameterToStringHello:(NSObject *)anObject {

    // The calling message passed an argument.
    // Local parameter anObject points to the same address as the argument.

    // Re-assign parameter.
    // This changes value within scope of this method only.
    // This doesn't change value of argument within the caller's scope.
    // To change value within caller's scope,
    // caller would have to pass an address for us to dereference.
    // However, it would be clearer/more goof proof to use a new variable to return.
    anObject = @"Hello";

    // Now anObject points to a different address than the argument.
    return anObject;
}

@end
