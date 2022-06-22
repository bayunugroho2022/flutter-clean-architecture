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
- Model
- Repository
- Usecase
- Either concept (Left(Failure) and right(Success))

## Presentation Layer(MVVM)
- Model
- View
- Viewmodel
- Usecase rule to connect to outside world
- Creating data class similiar to data class in kotlin 

## Presentation Layer(UI)
- Login screen
- Register screen
- ... screen

## Presentation Layer (State Renderer)
- Full Screen error state
- Full Screen loading state
- Popup loading state
- Popup error state
- Empty state (no data)

## Presentation Layer (Resources)
- Color manager
- Route manager
- Asset manager
- Font manager
- language manager
- Loutes manager
- String manager
- Style manager
- Theme manager
- Value manager

# Workflow
- Build flutter app
- Send notification and app to telegram when app success build  
