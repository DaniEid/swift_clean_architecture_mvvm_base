# Swift Clean Architecture MVVM
This is an example of clean architecture and MVVM pattern written in swift 

First of all thanks to all of those who made our lives easier 
Thanks to uncle bob for the clean architecture 

Thanks to Mocky[https://designer.mocky.io] for creating the mocking APIs


# Generics 
I've tried to use generics to make every things follows the same patterns.

The base view controller will contain a view model that will be a generic based on the base view model

The base view model will have a usecase which is the parent use case for all usecases in the project 

The networking class have only one method that will call our API using #Alamofire and for parsing it will take a generic model that is Codable


# The Domain layer 
Contains all the use cases, Entities and the defintion of our repository for the project 
we have a single use that will represent one task that should be done
we also have usecase which group all the usecases that is related to one feature

within the single use cases, I have intended to convert the completion handler to combine, this is only to show the two ways of dealing with our requests although we can stick to combine within the networking layer or stick to completion handler 


# The Data layer 
Contains the data sources that implement the protocl of data source 
for now there is only remote data source that will fetch the content from the API, but when creating the local data source we should implement the protocol of the data source.

we also have the repository implementation within this layer that will be responsible of declaring the implementation from the domain layer
and for sure will be responsible of fetching the data and handling the data from local/remote sources

The difference between the model in this layer and the entity in the domain layer is that the model here will be used to parse the json Object from the API, whereas the entity in the domain will be used to communicate with the presentation layer as it will be easier after converting the model to entity 


# The Presentation layer
Contains all the views, storyboards, custom views, custom cells and the view controllers
each view model will be a child for BaseViewModel, and each view controller will be a child for BaseViewController where we should declare the viewmodel that will be used
 
# To DO:
- Enhance the API class to inculde all the cases 
- Add more tests
- Replace Completion handler with Combine and keep the refrence for completion handle 
- Add Swift UI examples 

