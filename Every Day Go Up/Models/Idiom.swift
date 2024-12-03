//
//  Idiom.swift
//  Every Day Go Up
//
//  Created by Wayne on 2024/12/2.
//
import Foundation


struct Idiom: Identifiable, Codable {
    let id = UUID() // Ensures each idiom has a unique identifier
    let chinese: String
    let pinyin: String
    let literalMeaning: String
    let figurativeMeaning: String
    let example: String
}
    
    

// Define the IdiomStore to manage the idioms
class IdiomStore: ObservableObject {
    // An array of idioms published to notify the views about updates
    @Published var idioms: [Idiom] = [
        Idiom(
            chinese: "狐假虎威",
            pinyin: "hú jiǎ hǔ wēi",
            literalMeaning: "A fox borrowing the tiger's might",
            figurativeMeaning: "To use someone else's power or influence to intimidate others.",
            example: "小张仗着他家养了一只会汪汪叫的大猫，到处跟人吹嘘自己很厉害，真是狐假虎威！\n(Xiǎo Zhāng zhàngzhe tā jiā yǎng le yī zhī huì wāngwāng jiào de dà māo, dàochù gēn rén chuīxū zìjǐ hěn lìhài, zhēnshi hú jiǎ hǔ wēi!)\nXiao Zhang keeps bragging about being powerful because his housecat barks like a dog—what a case of a fox borrowing the tiger's might!"
        ),
        Idiom(
            chinese: "画蛇添足",
            pinyin: "huà shé tiān zú",
            literalMeaning: "To draw legs on a snake",
            figurativeMeaning: "To add unnecessary or redundant details.",
            example: "小明把泡面的调料包拆开后，还往里面加了草莓酱，真是画蛇添足！\n(Xiǎo Míng bǎ pàomiàn de tiáoliào bāo chāikāi hòu, hái wǎng lǐmiàn jiā le cǎoméijiàng, zhēnshi huà shé tiān zú!)\nXiao Ming opened the instant noodle seasoning packet and then added strawberry jam—what a classic example of drawing legs on a snake!"
        ),
        Idiom(
            chinese: "杯弓蛇影",
            pinyin: "bēi gōng shé yǐng",
            literalMeaning: "Seeing a snake’s shadow in a cup",
            figurativeMeaning: "To be overly suspicious or paranoid, imagining danger where none exists.",
            example: "听到厨房的声音，小李以为是小偷，结果发现是冰箱在挪位置，真是杯弓蛇影！\n(Tīngdào chúfáng de shēngyīn, xiǎo Lǐ yǐwéi shì xiǎotōu, jiéguǒ fāxiàn shì bīngxiāng zài nuó wèizhì, zhēnshi bēi gōng shé yǐng!)\nHearing a noise in the kitchen, Xiao Li thought it was a thief but found out it was the fridge moving itself—such a case of seeing a snake's shadow in a cup!"
        ),
        Idiom(
            chinese: "入乡随俗",
            pinyin: "rù xiāng suí sú",
            literalMeaning: "Enter a village and follow its customs",
            figurativeMeaning: "Adapt to local customs when in a new place.",
            example: "小王到日本旅行，硬是用筷子喝汤，最后发现没喝到几口，才明白有勺子的好处，真是入乡随俗啊！\n(Xiǎo Wáng dào Rìběn lǚxíng, yìngshì yòng kuàizi hē tāng, zuìhòu fāxiàn méi hē dào jǐ kǒu, cái míngbái yǒu sháozi de hǎochù, zhēnshi rù xiāng suí sú a!)\nXiao Wang went to Japan and insisted on drinking soup with chopsticks, only to realize later how useful spoons are—he really should’ve followed the local customs!"
        ),
        Idiom(
            chinese: "自相矛盾",
            pinyin: "zì xiāng máo dùn",
            literalMeaning: "To fight with one’s own spear and shield",
            figurativeMeaning: "To contradict oneself; self-contradiction.",
            example: "他说自己在减肥，但一边说一边手里拿着炸鸡，这不是自相矛盾吗？\n(Tā shuō zìjǐ zài jiǎnféi, dàn yībiān shuō yībiān shǒu lǐ názhe zhàjī, zhè bùshì zì xiāng máo dùn ma?)\nHe says he’s on a diet but is holding fried chicken while saying it—isn’t that self-contradiction?"
        ),
        Idiom(
            chinese: "井底之蛙",
            pinyin: "jǐng dǐ zhī wā",
            literalMeaning: "A frog at the bottom of a well",
            figurativeMeaning: "A person with a narrow or limited perspective.",
            example: "小刚从来没见过电动牙刷，他说：“这不就是高科技棉花棒吗？” 真是井底之蛙！\n(Xiǎo Gāng cónglái méi jiànguò diàndòng yáshuā, tā shuō: 'Zhè bù jiùshì gāokējì miánhuā bàng ma?' Zhēnshi jǐng dǐ zhī wā!)\nXiao Gang had never seen an electric toothbrush and said, “Isn’t this just a high-tech cotton swab?” What a frog at the bottom of a well!"
        ),
        Idiom(
            chinese: "画龙点睛",
            pinyin: "huà lóng diǎn jīng",
            literalMeaning: "To dot the eyes on a painted dragon",
            figurativeMeaning: "To add the finishing touch, making something complete or perfect.",
            example: "蛋糕很好看，但老板非要在上面画个笑脸，结果看起来像只土豆，真是画龙点睛失败！\n(Dàngāo hěn hǎokàn, dàn lǎobǎn fēi yào zài shàngmiàn huà gè xiàoliǎn, jiéguǒ kàn qǐlái xiàng zhī tǔdòu, zhēnshi huà lóng diǎn jīng shībài!)\nThe cake looked great, but the baker insisted on drawing a smiley face on top, and it ended up looking like a potato—**a failed finishing touch**!"
        ),
        Idiom(
            chinese: "胸有成竹",
            pinyin: "xiōng yǒu chéng zhú",
            literalMeaning: "To have a complete bamboo painting in one’s mind",
            figurativeMeaning: "To be confident and prepared, having a clear plan or vision.",
            example: "他说自己胸有成竹，但五分钟后又开始查“如何煮米饭”的视频了，真是胸有成竹吗？\n(Tā shuō zìjǐ xiōng yǒu chéng zhú, dàn wǔ fēnzhōng hòu yòu kāishǐ chá 'Rúhé zhǔ mǐfàn' de shìpín le.)\nHe claimed to be confident, but five minutes later, he was watching 'how to cook rice' tutorials—was he really confident and prepared?"
        ),
        Idiom(
            chinese: "一箭双雕",
            pinyin: "yī jiàn shuāng diāo",
            literalMeaning: "One arrow, two eagles",
            figurativeMeaning: "To accomplish two things with a single effort.",
            example: "他吃自助餐的时候，一盘放披萨，一盘放寿司，说这样一箭双雕，可惜他两样都吃撑了。\n(Tā chī zìzhùcān de shíhou, yī pán fàng pīsa, yī pán fàng shòusī, shuō zhèyàng yī jiàn shuāng diāo, kěxī tā liǎng yàng dōu chī chēng le.)\nAt the buffet, he piled pizza on one plate and sushi on another, saying it was 'killing two birds with one stone'—but he ended up overeating both."
        ),
        Idiom(
            chinese: "滴水穿石",
            pinyin: "dī shuǐ chuān shí",
            literalMeaning: "Dripping water penetrates stone",
            figurativeMeaning: "Perseverance leads to success, even in difficult situations.",
            example: "他每天锻炼五分钟，觉得'滴水穿石'，可是半年后体重只少了两克。\n(Tā měitiān duànliàn wǔ fēnzhōng, juéde 'dī shuǐ chuān shí,' kěshì bànnián hòu tǐzhòng zhǐ shǎo le liǎng kè.)\nHe exercised five minutes a day, believing in 'perseverance,' but after half a year, he had only lost two grams—dripping water didn’t quite penetrate stone!"
        )
        // Add more idioms here...
    ]
    
    
    @Published var completedIdioms: [Idiom] = [] // Stores completed idioms
    @Published var currentIndex: Int = 0         // Tracks the current idiom
    

    init() {
            loadState() // Load saved state, if any
        }
    
    func markAsComplete() {
        if currentIndex < idioms.count {
            let completedIdiom = idioms[currentIndex]
            completedIdioms.append(completedIdiom) // Add to completed idioms
            currentIndex += 1
            saveState() // Save updated state
        }
    }

    func saveState() {
        let encoder = JSONEncoder()
        if let encodedIdioms = try? encoder.encode(completedIdioms),
           let encodedIndex = try? encoder.encode(currentIndex) {
            UserDefaults.standard.set(encodedIdioms, forKey: "CompletedIdioms")
            UserDefaults.standard.set(encodedIndex, forKey: "CurrentIndex")
        }
    }

    func loadState() {
        let decoder = JSONDecoder()
        if let savedIdioms = UserDefaults.standard.data(forKey: "CompletedIdioms"),
           let savedIndex = UserDefaults.standard.data(forKey: "CurrentIndex") {
            if let decodedIdioms = try? decoder.decode([Idiom].self, from: savedIdioms),
               let decodedIndex = try? decoder.decode(Int.self, from: savedIndex) {
                completedIdioms = decodedIdioms
                currentIndex = decodedIndex
            }
        }
    }

    func reset() {
        completedIdioms = []
        currentIndex = 0
        saveState()
    }
}


