import SwiftUI

struct ReviewView: View {
    @ObservedObject var idiomStore: IdiomStore

    var body: some View {
        NavigationView {
            List(idiomStore.completedIdioms) { idiom in
                NavigationLink(destination: IdiomDetailView(idiom: idiom)) {
                    Text(idiom.chinese)
                        .font(.headline)
                }
            }
            .navigationTitle("Review")
        }
    }
}


struct IdiomDetailView: View {
    let idiom: Idiom

    var body: some View {
        VStack {
            Text(idiom.chinese)
                .font(.largeTitle)
                .padding()

            Text(idiom.pinyin)
                .font(.title2)
                .foregroundColor(.gray)

            Text(idiom.literalMeaning)
                .font(.title3)
                .padding(.top)

            Text(idiom.figurativeMeaning)
                .font(.body)
                .padding(.top)

            Text(idiom.example)
                .font(.body)
                .italic()
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            Spacer()
        }
        .padding()
        .navigationTitle("Idiom Detail")
    }
}
