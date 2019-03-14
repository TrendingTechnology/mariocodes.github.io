---
layout: post
title: Java frameworks - Spring notes
date:   2019-03-06 13:31:00 +0100
categories: programming java frameworks spring
permalink: /frameworks/java/spring
---

### Spring Context
#### Spring Cache  
A cache itself may be imagined as a key-value map. For a basic Cache we need:  
* `@EnableCaching` tag in `@Configuration` class  
* Declare a `CacheManager` Bean  
* Tag the method to cache w. `@Cacheable`   
* Create a method with `@CacheEvict`

We may declare +1 cache(s) at the cache manager and select the one we want to use in the method we tag. As key for the cache we may use any conjunction of the parameters given to the method, or if this is a class, any of it's accessible variables. The cache will only be triggered when the exact key is given again. **Then the method won't be executed** and the value will be directly given from the cache. If the parameters don't match any key, the method will be executed as normal and then the value will be saved into the cache to be returned the next time.  

Caution with logs in big apps as they need to be written accordingly.  
The hard part is not knowing when to cache something, but to know when to Evict the cache.  
<!--more-->
#### Default Cache  
Spring provides `Cache` and `CacheManager` as main abstractions for the caching logic. They do not provide the actual storage to store data. For that we have some options out of the box on the JDK such as `SimpleCacheManager`. It's based on `ConcurrentMap` and it's useful when we need a really basic Cache, but it does not support the eviction or persistence of the Cache.  

#### EHCache
The entities to save, have to implement `Serializable` interface. If we don't do that, it'll throw a `NotSerializableException`.  
The config for the several caches is specified in `ehcache.xml`

#### Infinispan  
It's an in-memory, highly concurrent Cache. It has built-in Eviction. It may be deployed in local mode but it's a best choice for its cluster mode (distributed or replicated).

##### References
[https://spring.io/guides/gs/caching/](https://spring.io/guides/gs/caching/)  
[https://www.baeldung.com/spring-cache-tutorial](https://www.baeldung.com/spring-cache-tutorial)  
[http://websystique.com/spring/spring-4-cache-tutorial-with-ehcache/](http://websystique.com/spring/spring-4-cache-tutorial-with-ehcache/)  
[https://blog.infinispan.org/2010/02/infinispan-as-local-cache.html](https://blog.infinispan.org/2010/02/infinispan-as-local-cache.html)  
[http://infinispan.org/docs/stable/user_guide/user_guide.html#clustering](http://infinispan.org/docs/stable/user_guide/user_guide.html#clustering)
