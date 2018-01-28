//
//  main.m
//  BasicSyntaxObjC
//
//  Created by Артур Азаров on 28.01.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

#import <Foundation/Foundation.h>

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
    }
    return 0;
}
