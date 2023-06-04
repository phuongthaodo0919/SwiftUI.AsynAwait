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
* Use ***Continuation*** to expose a closure function to an async/await function
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
### Create custom modifier view
1. Create View Modifier
```
struct CustomButtonModifier: ViewModifier { }
```
2. Apply the View Modifier by extend the View protocol
```
extension View {
    func customButtonModifier(font: Font = .title) -> some View {
        modifier(CustomButtonModifier(font: font))
    }
}
```
4. The View Modifier can be used in any views or other view modifiers
```
Text("Hello, I'm text field").customButtonModifier(font: .largeTitle)

Button("Click me button") {
  //Do something
}.customButtonModifier(font: .caption)
```

