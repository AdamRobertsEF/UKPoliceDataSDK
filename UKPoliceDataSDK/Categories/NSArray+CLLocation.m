//
//  NSArray+CLLocation.m
//  UKPoliceDataSDK
//
//  Created by Joshua Santos on 8/13/15.
//  Copyright © 2015 Enigmatic Flare Ltd. All rights reserved.
//

#import "NSArray+CLLocation.h"
#import "CLLocation+String.h"

@implementation NSArray (CLLocation)

+(NSArray*)coordinateArrayFromCLLocationArray:(NSArray*)array{
    NSMutableArray *coordinateArray = [[NSMutableArray alloc] init];
    for(id obj in array) [coordinateArray addObject:[obj coordinateString]];
    return coordinateArray;
}

-(NSArray*) coordinateArrayFromCLLocationArray{
     return [NSArray coordinateArrayFromCLLocationArray:self];
}

@end
