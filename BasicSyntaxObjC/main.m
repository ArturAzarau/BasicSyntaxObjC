//
//  main.m
//  BasicSyntaxObjC
//
//  Created by Артур Азаров on 28.01.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // MARK: - creating a variable
        int i = 10;
        
        // MARK: - creating a constant
        const int j = 10;
        
        // MARK: - creating a string
        NSString * str = @"Reject the common sense to make the impossible possible";
        
        // MARK: - creating an array
        NSArray * arr = @[@"Hello", @"World"];
        
        // MARK: - conditions
        if (i == 10) {
            NSLog(@"Hello, World!");
        }
        
        // MARK: - switch statements
        // you cannot use the first line of a case block to declare a new variable
        // unless you wrap the case block in braces
        switch (i) {
            case 20:
                NSLog(@"It's 20!");
                int foo = 1; // NSLog comes first so it's valid
                break;
            case 40:
            {
                int bar = 1; // valid cuz of braces
                NSLog(@"It;s 40!");
            }
                
            default:
                break;
        }
        
        // MARK: - Loops
        NSArray * names = @[@"Laura", @"Janet", @"Kim"];
        
        for (NSString * name in names) {
        // %@ is a format specifier, and means "insert the contents of an object here"
            NSLog(@"Hello, %@", name);
        }
        
        // C-style loops
        for (int i = 0; i <= 5; ++i) {
            NSLog(@"%d * %d is %d", i, i, i * i);
        }
        
        // MARK: - Nil-coalescing
        NSString * name = nil;
        NSLog(@"Hello, %@!", name ?: @"Anonymous");
        
        // MARK: - creating constant string ??????
        const NSString * first = @"Hello";
        
        // MARK: - Constant pointer
        NSString const * second = @"World!";
        
        // MARK: - Format specifiers: -
        // %@ - contents of object
        // %d - int
        // %p - pointer of an object
        // %f - floating point numbers, %.2f - print a floating-point number up to two decimal places
        // %ld - long ints
        
        NSLog(@"%ld", (long)i);
        
        // MARK: - Data types -
        
        // MARK: - Strings
        
        // Creating a string
        NSString * foo = @"Hello, World!";
        
        NSInteger number = 42;
        NSString * output = [NSString stringWithFormat:@"You picked %ld", (long)number];
        NSLog(@"%@", output);
        
        // identical code with alloc/init
        NSString * anotherOutput = [[NSString alloc] initWithFormat:@"You picked %ld", (long)number];
        
        // load a string from the contents of a file
        NSString * thirdOutput = [[NSString alloc] initWithContentsOfFile:@"hello.txt" usedEncoding:nil error:nil];
        
        // Strings are compared using isEqualToString method, and not ==
        
        // To create mutable string, you can either create a mutable copy of an existing string, or use of the NSMutableString inits.
        NSString * hello = [@"Hello" mutableCopy];
        NSString * anotherHello = [NSMutableString stringWithFormat:@"..."];
        
        // stringWithCapacity init lets you tell the system how big you expect the string to grow, which allows the system to avoid reallocating RAM if your string grows later.
        NSString * longString = [NSMutableString stringWithCapacity:4096];
        
        // Useful string functions
        // NSStringFromClass(): Give it a class name, e.g. [myObject class], and it will return      “MyObject”.
        // NSStringFromRect(): Give it a CGRect and get back the origin and size in one string.
        // NSStringFromSize(): Give it a CGSize and get back the width and height values.
        // NSStringFromPoint(): Give it a CGPoint and get back the X and Y coordinates.
        
        // MARK: - Arrays
        NSArray * villains = @[@"Weeping Angels", @"Cybermen", @"Daleks", @"Vashta Nerada"];
        for (NSString * villain in villains) {
            NSLog(@"Can the doctor defeat the %@? Yes, he can!", villain);
        }
        
        // loop in reverse
        for (NSString * villain in [villains reverseObjectEnumerator]) {
            NSLog(@"Can the doctor defeat the %@? Yes, he can!", villain);
        }
        
        // creating array with arrayWithObjects init
        NSArray * anotherVillains = [NSArray arrayWithObjects:@"Weeping Angels", @"Cybermen", @"Daleks", @"Vashta Nerada", nil];
        
        // indexing arrays
        NSLog(@"The %@ are my favourite villains.", villains[2]);
        
        // another way of indexing
        NSLog(@"The %@ are my favourite villains.", [villains objectAtIndex:2]);
        
        // example of count method
        NSLog(@"The Doctor faced %ld villains in that episode.", (long)[villains count]);
        
        // Sorting array
        NSArray * sorted = [villains sortedArrayUsingSelector:@selector(compare:)];
        
        // Functional techniques
        [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
            NSLog(@"Can the Doctor defeat the %@? Yes, he can!", obj);
        }];
        
        // Key paths
        NSArray *numbers = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
        NSNumber *sum = [numbers valueForKeyPath:@"@sum.self"];
        NSNumber *avg = [numbers valueForKeyPath:@"@avg.self"];
        NSNumber *min = [numbers valueForKeyPath:@"@min.self"];
        NSNumber *max = [numbers valueForKeyPath:@"@max.self"];
        NSLog(@"Total: %ld", (long)[sum integerValue]);
        NSLog(@"Avg: %ld", (long)[avg integerValue]);
        NSLog(@"Min: %ld", (long)[min integerValue]);
        NSLog(@"Max: %ld", (long)[max integerValue]);
        
        // MARK: - Dictionaries
        // example
        NSDictionary *ships = @{
                                @"Serenity" : @"Firefly",
                                @"Enterprise" : @"Star Trek",
                                @"Executor" : @"Star Wars"
                                };
        
        // old fucking retarded syntax
        NSDictionary *anotherShips = [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"Firefly",@"Serenity",
                                      @"Star Trek", @"Enterprise",
                                      @"Star Wars", @"Executor",
                                      nil];
        
        // print out the values
        // one way
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key,ships[key]);
        }
        
        // another way
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key,[ships objectForKey:key]);
        }
        
        // Sets
        // counted set example
        NSCountedSet *anotherNumbers = [NSCountedSet setWithObjects: @1, @3, @2, @8, @3, @6, @8, @8, @5, @1, @6, @3, nil];
        
        for (NSString *value in [anotherNumbers allObjects]) {
            NSLog(@"%@ appears %ld times", value, [anotherNumbers countForObject:value]);
        }
        
        // Generics
        NSArray<NSNumber *> * thirdNumbers = @[@42, @556, @69, @3.141];
        for (NSString *number in numbers) {
            NSLog(@"%@ is %ld letters", number, [number length]);
        }
        
        // MARK: - NSValue
        // example
        NSValue *rect = [NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)];
        NSValue *point = [NSValue valueWithPoint:NSMakePoint(0, 0)];
        NSValue *size = [NSValue valueWithSize:NSMakeSize(10, 10)];
        
        // MARK: - Blocks
        // void: The block returns nothing.
        // (^printUniversalGreeting): Put the block into a variable called “printUniversalGreeting”.
        // (void): The block accepts no parameters.
        // = ^{ ... }: The contents of the block..
        void (^printUniversalGreeting)(void) = ^{
            NSLog(@"This fucking annoying!");
        };
        printUniversalGreeting();
        
        // another example
        NSString* (^printGreeting)(NSString*) = ^(NSString* name) {
            return [NSString stringWithFormat:@"Hello,%@",name];
        };
        
        // modify variable inside block
        NSInteger __block anotherNumber = 0;
        
        NSString* (^printMeaningOfLife)(void) = ^{
            anotherNumber = 42;
            return [NSString stringWithFormat:@"How many roads must a man walk down? %ld.", number];
        };
        
        NSLog(@"%@", printMeaningOfLife());
        
        // MARK: - Classes
        Person *person = [Person new];
        [person printGreetingTo:@"Taylor" atTimeOfDay:@"evening"];
        
        // performing a selector
        [person performSelector:@selector(printGreetingTo:atTimeOfDay:) withObject:@"Taylor" withObject:@"morning"];
        
        // availability checking
        if (@available(iOS 9, *)) {
            // code goes here
        }
        
        // MARK: Properties
        person->name = @"Taylor";
        person.secondName = @"Swift";
        
        
    return 0;
}
