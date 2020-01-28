# Intrinio :chart:

[Intrinio](https://intrinio.com/) is a data warehouse for stocks and other investment vehicles. This project uses Intrinio's free but limited developer sandbox endpoint to explore the usage of [PromiseKit](https://github.com/mxcl/PromiseKit) in an iOS Project


# Current Features :tada:
- Calls Intrinio sandbox api upon app load using an initialized `Intrinio#Manager` and fetches a specified _hard coded_ target company (AAPL)
- Logs decoded company as an insteance of `Intrinio#Company`
- Initializes a `Intrinio#FakeTicker` for target company that mimics a continuously changing security value
- Logs ticker value through `NotificationCenter`


# Tech Loadout :computer:
- [CocoaPods](https://cocoapods.org/) as dependency manager
- [PromiseKit](https://github.com/mxcl/PromiseKit)
- Native `URLSession` for all network calls
