# SwiftUI.AsynAwait

### Async/Await with URLSession.shared.data( )
* Use ```let (data, urlResponse) = try await URLSession.shared.data(from: url)``` to get the async data from the server
* To perform an async method to get the data before the view is showed
```
.task {
   await populateDates()
}
```
* To perform an async method on the button action
```
Task.init(operation: {
    await populateDates()
})
```

