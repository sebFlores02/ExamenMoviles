

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
                .onAppear {
                Task {
                    await viewModel.getList()
                    viewModel.isLoading = false
                }
            }
        } else  {
            List(viewModel.movieCollection) { MovieBase in
                VStack (alignment: .leading) {
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(MovieBase.movie.backdrop_path)"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 308, height: 258, alignment: .center)
                    HStack {
                        Text(MovieBase.movie.title)
                            .bold()
                        Spacer()
                        Text(MovieBase.movie.original_language)
                    }
                    Text(MovieBase.movie.overview)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
                .onAppear {
                    Task {
                        await viewModel.getList()
    
                    }
                }
                .alert(isPresented: $viewModel.error) {
                            Alert(title: Text("Error"), message: Text("Failed to load data. Please try again."), dismissButton: .default(Text("OK")))
                }
            }
            
        }
        
    }
}
