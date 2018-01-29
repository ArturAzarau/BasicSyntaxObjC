//
//  Person.m
//  BasicSyntaxObjC
//
//  Created by Артур Азаров on 29.01.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

#import "Person.h"

// class extension to create private property
@interface Person ()
@property (copy) NSString * secondName;
@end

@implementation Person
// it's done by default, but as we write custom getters and (nonatomic) setters, that's should be done by hands
static NSString * _thirdName = nil;
@synthesize secondName = _secondName;
// - means normal method, + means static method
// (void) - return type
// space after - is ok, but space between return type and name isn't ok
- (void)printGreetingTo:(NSString*)name atTimeOfDay:(NSString *)time {
    // accessing properties
    if ([time isEqualToString:@"morning"]) {
        NSLog(@"Good morning,%@!",self.secondName);
        NSLog(@"Good morning,%@!",_secondName);
    } else {
        NSLog(@"Good evening,%@!",[self secondName]);
    }
    
}

- (NSString*)secondName {
    NSLog(@"Reading name!");
    return _secondName;
}

- (void)setSecondName:(NSString *)secondName {
    NSLog(@"Writing a name!");
    _secondName = secondName;
}

+ (instancetype)personWithName:(NSString*)name {
    return [[self alloc] initWithName:name];
}

+ (NSString *)thirdName {
    return _thirdName;
}

+(void)setThirdName:(NSString *)thirdName {
    _thirdName = thirdName;
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self.secondName = name;;
    }
    return self;
}
@end
