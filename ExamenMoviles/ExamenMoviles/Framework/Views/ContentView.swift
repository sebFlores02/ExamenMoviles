import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        List(viewModel.movieCollection) { MovieBase in
            VStack (alignment: .leading) {
                HStack {
                    Text(MovieBase.movie.title)
                    Spacer()
                }
//                Text(MovieBase.movie.originalTitle)
                
            }
        }
        Text("ayuda")
        
            .onAppear {
                Task {
                    await viewModel.getList()
//                    await viewModel.getUnit()
                    
                }
            }
    }
}
