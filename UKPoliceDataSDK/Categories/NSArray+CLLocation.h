//
//  NSArray+CLLocation.h
//  UKPoliceDataSDK
//
//  Created by Adam Roberts and Joshua Santos on 8/13/15.
//  Copyright © 2015 Enigmatic Flare Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CLLocation)

+(NSArray*)coordinateArrayFromCLLocationArray:(NSArray*)array;
-(NSArray*)coordinateArrayFromCLLocationArray;

@end
