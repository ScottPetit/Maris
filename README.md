# Maris

**The glue between AFNetworking and Mantle**

<br/>
[![Build Status](https://travis-ci.org/ScottPetit/Maris.png?branch=master)](https://travis-ci.org/ScottPetit/Maris)

Maris is the glue between [AFNetworking](https://github.com/afnetworking/afnetworking) and [Mantle](https://github.com/MantleFramework/Mantle).  With Maris you never have to write another AFNetworking Response Serializer again.  Just tell Maris what MTLModel subclass to use and get your fully formed objects back.

Maris was inspired by me trying to use [Overcoat](https://github.com/gonzalezreal/Overcoat) on a project but wanting to use the NSURLSession side of AFNetworking.  Therefore Maris supports NSURLSession and AFNetworking out of the box.

> Maris is named after [Roger Maris](http://en.wikipedia.org/wiki/Roger_Maris), a former American baseball player who is most known for hitting (at the time) a Major League record 61 home runs during the 1961 season for the New York Yankees, breaking Babe Ruth's single-season record of 60 home runs in 1927.

## Usage

Maris provides two subclasses of AFNetworking classes.  REMHTTPSessionManager and REMHTTPRequestOperationManager.  These provide the interface by which you can unify AFNetworking and Mantle.  Instead of using the AFHTTPSessionManager method of

```objective-c
AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
[manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];
```

Maris provides a method like this

```objective-c
REMHTTPSessionManager *manager = [REMHTTPSessionManager manager];
[manager GET:@"http://example.com/resources.json" parameters:nil modelClass:[MYObject class] keyPath:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Model object(s): %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];
```

By providing the modelClass and the key path for your objects (can be nil), Maris is able to handle deserializing JSON into your model objects.  It’s that easy.
