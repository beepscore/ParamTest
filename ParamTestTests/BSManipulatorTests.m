//
//  BSManipulatorTests.m
//  ParamTestTests
//
//  Created by Steve Baker on 8/17/13.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "BSManipulator.h"

@interface BSManipulatorTests : SenTestCase
@end

@implementation BSManipulatorTests

- (void)setUp
{
    [super setUp];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.

    [super tearDown];
}

- (void)testChangeIntegerParameter {
    BSManipulator *manipulator = [[BSManipulator alloc] init];
    NSInteger testParam = 3;
    NSInteger expectedResult = testParam + 1;
    NSInteger actualResult = [manipulator incrementParameter:testParam];
    STAssertEquals(expectedResult, actualResult,
                   @"expected %d but got %d", expectedResult, actualResult);
}

- (void)testChangeIntegerAtAddressToSeven {
    BSManipulator *manipulator = [[BSManipulator alloc] init];
    NSInteger testParam = 1981;
    NSLog(@"testParam stored at address = %p", &testParam);

    [manipulator changeIntegerAtAddressToSeven:&testParam];

    NSInteger expectedResult = 7;
    NSInteger actualResult = testParam;

    STAssertEquals(expectedResult, actualResult,
                   @"expected %d but got %d", expectedResult, actualResult);
}

/*
 - (void)testStringFun:(id)sender
{
    [self playWithString];
    [self playWithStrings];
}


- (void)testParameterFun:(id)sender
{
    NSString* sillyString = @"I'm a silly string";
    NSLog(@"sillyString stored at address &sillyString = %qx", &sillyString);
    NSLog(@"sillyString points to address = %qx", sillyString);
    NSLog(@"sillyString points to object with description = %@", sillyString);
    [self playWithObjectParameter:sillyString];
    // method did not change the value of the argument
    NSLog(@"sillyString stored at address &sillyString = %qx", &sillyString);
    NSLog(@"sillyString points to address = %qx", sillyString);
    NSLog(@"sillyString points to object with description = %@", sillyString);

    // send argument to receiver
    [self playWithScopeOfParameter:sillyString];
    // method did not change the value of the argument
    NSLog(@"sillyString stored at address &sillyString = %qx", &sillyString);
    NSLog(@"sillyString points to address = %qx", sillyString);
    NSLog(@"sillyString points to object with description = %@", sillyString);
}
*/

@end
