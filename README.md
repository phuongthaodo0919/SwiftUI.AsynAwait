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
* Use ***Continuation*** to convert closure function to async/await function
```
func getU() async throws -> [User] {
        return try await withCheckedThrowingContinuation({ continuation in
            userService.getUser { result in
                switch result {
                case .failure(let err):
                    continuation.resume(throwing: err)
                case .success(let users):
                    continuation.resume(returning: users)
                }
            }
        })
    }
```

