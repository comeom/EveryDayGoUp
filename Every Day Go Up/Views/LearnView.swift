import SwiftUI

struct LearnView: View {
    @ObservedObject var idiomStore: IdiomStore

    var body: some View {
        VStack {
            if idiomStore.currentIndex < idiomStore.idioms.count {
                let idiom = idiomStore.idioms[idiomStore.currentIndex]
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

                Button(action: idiomStore.markAsComplete) {
                    Text("Mark as Completed")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            } else {
                Text("Congratulations! You have completed all the idioms!")
                    .font(.title)
                    .padding()
            }
        }
        .padding()
        .navigationTitle("Learn")
    }
}
