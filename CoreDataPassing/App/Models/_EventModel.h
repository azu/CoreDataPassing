// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EventModel.h instead.

#import <CoreData/CoreData.h>


extern const struct EventModelAttributes {
	__unsafe_unretained NSString *timeStamp;
} EventModelAttributes;

extern const struct EventModelRelationships {
} EventModelRelationships;

extern const struct EventModelFetchedProperties {
} EventModelFetchedProperties;




@interface EventModelID : NSManagedObjectID {}
@end

@interface _EventModel : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventModelID*)objectID;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;






@end

@interface _EventModel (CoreDataGeneratedAccessors)

@end

@interface _EventModel (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




@end
