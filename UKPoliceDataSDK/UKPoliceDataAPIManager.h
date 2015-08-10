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

#pragma mark forces related

-(void)requestForces:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

#pragma mark crime related

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSDate*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location year:(NSString*)year completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)crimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)crimeCategoriesByDate:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)crimeLastUpdated:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)crimeOutcomes:(NSString*)CrimeID completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

#pragma mark neighbourhoods related

-(void)neighbourhoodsByForce:(NSString*)force completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)specificNeighbourhoodByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)specificNeighbourhoodBoundryByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)specificNeighbourhoodTeamByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)specificNeighbourhoodEventsByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)locationNeighbourhoodByLocation:(CLLocationCoordinate2D)location completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

#pragma mark stop and search related

-(void)stopAndSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)stopAndSearchByLocationID:(NSString*)locationID date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)stopAndSearchByNoLocationUsingForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

-(void)stopAndSearchByForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

#pragma mark /pagination

-(void)nextPagination:(NSURL*)paginationURL completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHander;

@end

