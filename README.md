# Flutter clean architecture with MVVM

## Screenshoot 
--

## Application Layer
- Application class
- Dependency injection
- Application Route manager ( Navigation Manager )
- Application preference ( Shared preference to save data to local storage )
- Extentions
- Shared Function

## Data Layer
- Data source (remote, local)
- Mapper
- Repository
- Request
- Resposnse
- Network ( http implementer, interceptor, error handler )

## Domain Layer
- model
- repository
- usecase
- Either concept (Left(Failure) and right(Success))

## Presentation Layer(MVVM)
- model
- view
- viewmodel
- usecase rule to connect to outside world
- creating data class similiar to data class in kotlin 

## Presentation Layer(UI)
- login screen
- register screen
- ... screen

## Presentation Layer (State Renderer)
- Full Screen error state
- Full Screen loading state
- popup loading state
- popup error state
- empty state (no data)

## Presentation Layer (Resources)
- Color manager
- route manager
- asset manager
- font manager
- language manager
- routes manager
- string manager
- style manager
- theme manager
- value manager

# Workflow
- Build flutter app
- send notification and app to telegram when app success build  
