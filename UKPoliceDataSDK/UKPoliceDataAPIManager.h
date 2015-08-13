//
//  UKPoliceDataAPIManager.h
//  UKPoliceDataAPI-SDK
//

#import "AFNetworking.h"
@import Foundation;
@import UIKit;
@import CoreLocation;

@interface UKPoliceDataAPIManager : NSObject

typedef void (^APIRequestCompletionBlock)(AFHTTPRequestOperation *operation, NSURLRequest *request, id JSON);

typedef void (^APIRequestFailureBlock)(AFHTTPRequestOperation *operation, id JSON);

+(instancetype)sharedManager;
-(NSString*)buildTestLocations;

#pragma mark forces related

-(void)requestForces:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

#pragma mark crime related

/*
 Street Level Crime Search By Location
 
 */

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSDate*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location year:(NSString*)year completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

/*
 Street Level Crime Search By Poly
 
 */

-(void)streetLevelCrimeSearchByPoly:(NSArray*)poly completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)streetLevelCrimeSearchByPoly:(NSArray*)poly date:(NSDate*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)streetLevelCrimeSearchByPoly:(NSArray*)poly year:(NSString*)year completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;


-(void)crimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)crimeSearchByPoly:(NSArray*)poly date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)crimeCategoriesByDate:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)crimeLastUpdated:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)crimeOutcomes:(NSString*)CrimeID completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

#pragma mark neighbourhoods related

-(void)neighbourhoodsByForce:(NSString*)force completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)specificNeighbourhoodByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)specificNeighbourhoodBoundryByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)specificNeighbourhoodTeamByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)specificNeighbourhoodEventsByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)locationNeighbourhoodByLocation:(CLLocationCoordinate2D)location completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

#pragma mark stop and search related

-(void)stopAndSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)stopAndSearchByLocationID:(NSString*)locationID date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)stopAndSearchByNoLocationUsingForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

-(void)stopAndSearchByForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

#pragma mark /pagination

-(void)nextPagination:(NSURL*)paginationURL completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler;

@end

