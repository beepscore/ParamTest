//
//  BSManipulator.h
//  ParamTest
//
//  Created by Steve Baker on 8/17/13.
//
//

#import <Foundation/Foundation.h>

@interface BSManipulator : NSObject

- (NSInteger)incrementParameter:(NSInteger)anInteger;

- (void)changeIntegerAtAddressToSeven:(NSInteger *)aPointer;

- (NSObject *)reassignParameterToStringHello:(NSObject *)anObject;

@end
