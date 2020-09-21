import UIKit
/*:
 # الواجب الثالث: لعبة UNO
 
 تحتوي لعبة الأونو على ٤ ألوان و١٠ أرقام.
 - تتكرر الأرقام لكل لون مرتين. ماعدا الرقم صفر، يتواجد مرة واحدة للون الواحد.
- توجد هناك ورقتين Action Cards لكل لون.
 1. Draw
 2. Reverse
 3. Pass

*/


//: ![Uno Deck](deck.jpg)


/*:
 ### المطلوب:
#### الجزء الأول:
 -- قم بإنشاء struct باسم Card به  الصفات التالية
 * color: String
 * number: Int
 
 -- قم بإنشاء مصفوفة من نوع `Card` فارغة، ثم قم بملئها بالأرقام فقط مرة واحدة من دون ال action cards ومن دون تكرار كل رقم مرتين (تكرار الأرقام بونص 🎁)
 
 - Green: 0 -> 9
 - Red: 0 -> 9
 - Blue: 0 -> 9
 - Yellow: 0 -> 9
 
 #### الجزء الثاني:
-- قم بإنشاء دالة بداخل الستركت Card باسم  `imageName`والتي تقوم بإرجاع اسم الصورة للكرت. قم بفتح المجلد Resources الموجود بداخل الplayground من النافذة اليسرى لرؤية طريقة تسمية الكرت
 ###### مثال على تسمية الكروت موضحة كالتالي، قم بتشغيل الكود لرؤية الصور أسفل هذه الأكواد:
 */


var blue_5 = UIImage(named: "Blue_5.png")
var red_9 = UIImage(named: "Red_9.png")

var green_Skip = UIImage(named: "Green_Skip.png")
var wild_Draw = UIImage(named: "Wild_Draw.png")


/*:
 
 
 ### الجزء الثالث (تجريب الكود😍):
 قم بإزالة الملاحظة عن الأسطر الأخيرة لتجربة الكود إن كان يعمل بشكل مناسب،
 الجزء الأول سيظهر كرت عشوائي
 الجزء الثاني سيظهر مجموعة الكروت كاملة 🃏🎴
 ```
 let randomCard = cards.randomElement()!
 let randomCardImage = UIImage(named: randomCard.imageName())
```

 ```
 let cardImages = cards.map{UIImage(named: $0.imageName())}
 randomCardImage
 ```
 إن تم ذلك بالشكل الصحيح من دون أي خطأ، فقد نجحت في المهمة! 🎉
 
  #### الجزء الرابع (بونص 🎁):
 -- قم بتعبئة مجموعة الكروت كل رقم يعرض مرتين، إلا الصفر، يعرض مرة واحدة، كما هو موضح في صورة مجموعة الأونو في بداية الملف
 -- قم باستعمال For Loop لتعبئة جميع الكروت

 
 #### الجزء الخامس (إكسترا إكسترا بونص 🌶🔥)
 -- قم بتعبئة المصفوفة أيضاً ب Action Cards من خلال تحويلك للصفات إلى optional بإضافة علامة الاستفهام إليها
اسم ال Action Cards موضح في الصور بداخل ال Resources
 
 ```
 var color: String?
 var action: String?
 var number: Int?
 ```
  لا تنسى إزالة كلمة  Optional بسبب تحويلك للمتغيرات إلى متغيرات بعلامة الاستفهام. ربما ستضطر إلى كتابة بعض أوامر if
  
 */


//: ---

//: # الحل ...



/// قم بإنشاء الستركت هنا

// struct ...

struct Card {
    
    var color: String?
    var number: Int?
    var action: String?
    
    func imageName () -> String {
        
        if color != nil && number != nil && action == nil {
            
            return "\(color!)_\(number!).png"

        }else if number == nil && color != nil {
            
            return "\(color!)_\(action!).png"
            
        }else if action != nil &&  color == nil && number == nil {
            
            return "\(action!).png"
            
        }else {
            
            return "Red_1.png"
            
        }
    }
}


//var cardred = Card(color: "Red", number: 6)
//UIImage(named: cardred.imageName())
//print (cardred.imageName())

//struct Action {
//
//    var color: String
//    var action: String
//
//    func actionImage () -> String {
//
//        return ("\(color)_\(action).png")
//
//    }
//
//}
//
//struct Special {
//
//    var special: String
//
//    func specialImage () -> String {
//
//        return ("\(special).png")
//
//    }
//
//}

var cards: [Card] = []
var colors = ["Green", "Red", "Blue", "Yellow"]
var actionCards = ["Draw", "Reverse", "Skip"]
var specialCards = ["Wild_Draw", "Wild"]

for colour in colors {
    for number in 0...9 {
        if number == 0 {
       cards.append(Card(color: colour, number: number))
        }else{
           cards.append(Card(color: colour, number: number))
            cards.append(Card(color: colour, number: number))
        }
    }
    for action in actionCards {
        cards.append(Card(color: colour, action: action))
        cards.append(Card(color: colour, action: action))
    }
    for special in specialCards {
        cards.append(Card(action: special))
    }
    
}

//for number in 1...9 {
//        for colour in colors {
//        cards.append(Card(color: colour, number: number))
//    }
//}
//
//for action in actionCards {
//    for color in colors{
//        for number in 0...2 {
//        cards.append(Card(color: color, action: action))
//        }
//    }
//}








// لا تقم بإزالة الملاحظات إلا عند وصولك للمطلوب الثالث


let randomCard = cards.randomElement()!
let randomCardImage = UIImage(named: randomCard.imageName())


let cardImages = cards.map{UIImage(named: $0.imageName())}
randomCardImage
cardImages
