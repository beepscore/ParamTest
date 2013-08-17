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
    NSLog(@"*****************************************************************");
}

- (void)testChangeIntegerAtAddressToSeven {
    BSManipulator *manipulator = [[BSManipulator alloc] init];
    NSInteger testParam = 1981;
    NSLog(@"testParam stored at address = %p", &testParam);

    // pass address of testParam, so method can change the value at that address
    [manipulator changeIntegerAtAddressToSeven:&testParam];

    NSInteger expectedResult = 7;
    NSInteger actualResult = testParam;

    STAssertEquals(expectedResult, actualResult,
                   @"expected %d but got %d", expectedResult, actualResult);
    NSLog(@"*****************************************************************");
}

- (void)testReassignParameterToStringHello {
    
    BSManipulator *manipulator = [[BSManipulator alloc] init];
    NSObject *suppliedObject = @[@2];
    NSLog(@"suppliedObject stored at address = %p", &suppliedObject);
    NSObject *suppliedObjectInitialValue = suppliedObject;
    NSLog(@"suppliedObjectInitialValue stored at address = %p", &suppliedObjectInitialValue);

    // Assert state before calling method under test
    // addresses aren't equal
    STAssertTrue((&suppliedObject != &suppliedObjectInitialValue), nil);
    // but the object values are equal
    STAssertEqualObjects(suppliedObject, suppliedObjectInitialValue,
                         @"expected %@ but got %@", suppliedObject, suppliedObjectInitialValue);

    // Now test the method reassignParameterToStringHello:
    // parameter type NSObject*
    NSObject *returnedObject = [manipulator reassignParameterToStringHello:suppliedObject];

    // method call didn't change value of suppliedObject within scope of testReassignParameterToStringHello
    STAssertEqualObjects(@[@2], suppliedObject,
                         @"expected %@ but got %@", @[@2], suppliedObject);
    STAssertEqualObjects(suppliedObjectInitialValue, suppliedObject,
                         @"expected %@ but got %@", suppliedObjectInitialValue, suppliedObject);

    // but method call did return an object with a different address
    STAssertTrue((returnedObject != suppliedObject), nil);

    NSString *expectedResult = @"Hello";
    // compare object values
    STAssertEqualObjects(expectedResult, returnedObject,
                         @"expected %@ but got %@", expectedResult, returnedObject);

    NSLog(@"*****************************************************************");
}

/*

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
