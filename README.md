# Maris

**The glue between AFNetworking and Mantle**

Maris is the glue between [AFNetworking](https://github.com/afnetworking/afnetworking) and [Mantle](https://github.com/MantleFramework/Mantle).  With Maris you never have to write another AFNetworking Response Serializer again.  Just tell Maris what MTLModel subclass to use and get your fully formed objects back.

> Maris is named after [Roger Maris](http://en.wikipedia.org/wiki/Roger_Maris), a former American baseball player who is most known for hitting (at the time) a Major League record 61 home runs during the 1961 season for the New York Yankees, breaking Babe Ruth's single-season record of 60 home runs in 1927.

## Usage

Maris provides two subclasses of AFNetworking classes.  REMHTTPSessionManager and REMHTTPRequestOperationManager.  These provide the interface by which you can unify AFNetworking and Mantle.  Instead of using the AFHTTPSessionManager method of 

```objective-c
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
[manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];
```

Maris provides a method like this

```objective-c
REMHTTPRequestOperationManager *manager = [REMHTTPRequestOperationManager manager];
[manager GET:@"http://example.com/resources.json" parameters:nil modelClass:[MYObject class] keyPath:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];
```

By providing the modelClass and the key path for your objects (can be nil), Maris is able to handle deserializing JSON into your model objects.  It’s that easy.
