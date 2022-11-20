## MovieCollectionApp

* Used <a href="https://www.themoviedb.org" alt="">TMDM</a> API to get most popular movies
* MVVM Structure
* Restful API 
* Add some case views when it's loading and data is empty.
* Utilized Enum for each case of View and UIConstants

```
// @escaping closure
func fetchPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        URLSession.shared.dataTask(with: Router.popular.url) { data, _, error in
            guard let data = data, error == nil else {
                print("URLSession went wrong!")
                completion(nil)
                return
            }

            let popularResponse = try? JSONDecoder().decode(PopularResponse.self, from: data)
            guard let movies = popularResponse?.results else {
                print("Decoding 'results' went wrong")
                completion(nil)
                return
            }

            completion(movies)
        }
        .resume()
    }
```

#
This project may not work properly. Also known as a bug in xcode, but I think, can use environmentObject to resolve this temporarily.
#  
https://user-images.githubusercontent.com/59377684/202921031-9e85f2b8-3c4b-442b-ac2a-2f8a019bb5cf.mov

