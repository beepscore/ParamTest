//
//  ParamTestTests.m
//  ParamTestTests
//
//  Created by Steve Baker on 8/17/13.
//
//

#import <SenTestingKit/SenTestingKit.h>

@interface ParamTestTests : SenTestCase
@end

@implementation ParamTestTests

- (void)testWaysToReferenceObject {
    // Ref http://forums.macrumors.com/showthread.php?t=625899

    // myObject is a pointer variable that points to an object of type NSObject
    // myObject's value is the address where the object is stored
    NSObject* myObject = [[NSObject alloc] init];

    NSLog(@"myObject is stored at address myObject = %p", myObject);
    NSString *myObjectAddressAsString = [NSString stringWithFormat:@"%p", myObject];
    // myObject description includes the address
    NSString *myObjectDescription = [myObject description];
    NSLog(@"myObject description %@", myObjectDescription);

    NSRange addressRange = NSMakeRange(11, 9);
    NSString *myObjectDescriptionSubstring = [myObjectDescription substringWithRange:addressRange];

    STAssertEqualObjects(myObjectAddressAsString, myObjectDescriptionSubstring,
                         @"expected %@ but got %@", myObjectAddressAsString, myObjectDescriptionSubstring);
}

- (void)testNil {
    // myObject is a pointer variable that points to an object of type NSObject
    // myObject's value is the address where the object is stored
    NSObject *myObject = nil;

    NSLog(@"myObject is stored at address myObject = %p", myObject);
    NSString *myObjectAddressAsString = [NSString stringWithFormat:@"%p", myObject];
    NSString *expectedResult = @"0x0";
    STAssertEqualObjects(expectedResult, myObjectAddressAsString,
                         @"expected %@ but got %@", expectedResult, myObjectAddressAsString);

    NSString *myObjectDescription = [myObject description];
    NSLog(@"myObject description %@", myObjectDescription);

    expectedResult = nil;
    STAssertEqualObjects(expectedResult, myObjectDescription,
                         @"expected %@ but got %@", expectedResult, myObjectDescription);
}

@end
