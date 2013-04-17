// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EventModel.m instead.

#import "_EventModel.h"

const struct EventModelAttributes EventModelAttributes = {
	.timeStamp = @"timeStamp",
};

const struct EventModelRelationships EventModelRelationships = {
};

const struct EventModelFetchedProperties EventModelFetchedProperties = {
};

@implementation EventModelID
@end

@implementation _EventModel

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (EventModelID*)objectID {
	return (EventModelID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic timeStamp;











@end
