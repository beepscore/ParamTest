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

- (void)testNil {
    // myObject is a pointer variable that points to an object of type NSObject
    // myObject's value is the address where the object is stored
    NSObject *myObject = nil;

    NSLog(@"myObject is stored at address myObject %p", myObject);
    NSString *myObjectAddressAsString = [NSString stringWithFormat:@"%p", myObject];
    NSString *expectedResult = @"0x0";
    STAssertEqualObjects(expectedResult, myObjectAddressAsString,
                         @"expected %@ but got %@", expectedResult, myObjectAddressAsString);

    NSString *myObjectDescription = [myObject description];
    NSLog(@"myObject description %@", myObjectDescription);

    expectedResult = nil;
    STAssertEqualObjects(expectedResult, myObjectDescription,
                         @"expected %@ but got %@", expectedResult, myObjectDescription);
    NSLog(@"*****************************************************************");
}

- (void)testStrings {
    // In Objective-C, objects are referenced by pointer values
    // "larry" is a pointer, its hex value is a memory address
    // larry points to an NSString
    NSString* larry = @"My name is Larry";
    NSLog(@"larry: %9p description: %@", larry, larry);

    // "moe" is a pointer, points to an NSString
    NSString* moe = @"My name is Moe";
    NSLog(@"  moe: %9p description: %@", moe, moe);

    moe = nil;
    NSLog(@"  moe: %9p description: %@", moe, moe);

    // Using type NSInteger throws type mismatch error, but NSString doesn't
    NSString *expectedResult = 0x0;
    STAssertEquals(expectedResult, moe,
                   @"expected %p but got %p", expectedResult, moe);

    moe = larry;
    NSLog(@"  moe: %9p description: %@", moe, moe);
    // compare addresses, not object values
    STAssertEquals(larry, moe,
                   @"expected %p but got %p", larry, moe);

    // compare object values
    STAssertEqualObjects(larry, moe,
                         @"expected %@ but got %@", larry, moe);

    // "curly" is a pointer
    NSString* curly = larry;
    NSLog(@"curly: %9p description: %@", curly, curly);
    // compare addresses, not object values
    STAssertEquals(larry, curly,
                   @"expected %p but got %p", larry, curly);

    // compare object values
    STAssertEqualObjects(larry, curly,
                         @"expected %@ but got %@", larry, curly);

    NSLog(@"*****************************************************************");
}

- (void)testWaysToReferenceObject {
    // Ref http://forums.macrumors.com/showthread.php?t=625899

    // myObject is a pointer variable that points to an object of type NSObject
    // myObject's value is the address where the object is stored
    NSObject* myObject = [[NSObject alloc] init];

    NSLog(@"myObject pointer is stored at address &myObject: %p", &myObject);
    
    NSLog(@"myObject is stored at address myObject: %p", myObject);
    NSString *myObjectAddressAsString = [NSString stringWithFormat:@"%p", myObject];
    
    // myObject description includes the address
    // <NSObject: 0x71524f0>
    NSString *myObjectDescription = [myObject description];
    NSLog(@"myObject description %@", myObjectDescription);

    NSString *myObjectDescriptionEnd = [myObjectDescription
                                        stringByReplacingOccurrencesOfString:@"<NSObject: "
                                        withString:@""];

    NSString *myObjectAddressStringFromDescription = [myObjectDescriptionEnd
                                                      stringByReplacingOccurrencesOfString:@">" withString:@""];
    
    STAssertEqualObjects(myObjectAddressAsString, myObjectAddressStringFromDescription,
                         @"expected %@ but got %@", myObjectAddressAsString, myObjectAddressStringFromDescription);

    // dereference address to get back to myObject.
    NSLog(@"*&myObject:  %@,  myObject: %@", *&myObject, myObject);
    STAssertEquals(myObject, *&myObject, @"expected dereferenced address equals object");
    NSLog(@"*****************************************************************");
}

- (void)testWaysToReferenceString {

    // Ref http://forums.macrumors.com/showthread.php?t=625899

    // myObject is a pointer variable that points to an object of type NSObject
    // myObject's value is the address where the object is stored
    NSObject* myObject = @"Hello";

    NSLog(@"myObject pointer is stored at address &myObject: %p", &myObject);
    
    NSLog(@"myObject is stored at address myObject: %p", myObject);
    
    // For an NSString, description is the string
    NSString *myObjectDescription = [myObject description];
    NSString *expectedDescription = @"Hello";
    STAssertEqualObjects(expectedDescription, myObjectDescription,
                         @"expected %@ but got %@", expectedDescription, myObjectDescription);

    // dereference address to get back to myObject.
    NSLog(@"*&myObject:  %@,  myObject: %@", *&myObject, myObject);
    STAssertEquals(myObject, *&myObject, @"expected dereferenced address equals object");
    NSLog(@"*****************************************************************");
}

@end
