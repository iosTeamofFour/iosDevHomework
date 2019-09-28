import UIKit

class Poker{
    var value:String
    var kind:String
    init(value:String,kind:String)
    {
        self.kind=kind
        self.value=value
    }
}

    var value=["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    var kind=["黑桃","红心","梅花","方块"]
    var allPoker : [Poker]=[]
    for _kind in kind{
        for _value in value
        {
            allPoker.append(Poker( value:_value, kind:_kind))
        }
    }
    var a = [[Poker]]()

func getARandomPoker()->Poker{
    let random = Int(arc4random()%51)
    return allPoker[random]
}

func personHavePoker(personNum:Int,pokerNum:Int)
{
    var j : UInt32 = 51
    if(personNum*pokerNum>52)
    {
        print ("输入不合法")
    }
    else{
        print("有\(personNum)个人,每人有\(pokerNum)张牌")
        
        for _ in 1...personNum {
            var row = [Poker]()
            for _ in 1...pokerNum {
              let random=Int(arc4random()%j)
                 j=j-1
                row.append(allPoker[random])
                 allPoker.remove(at:random)
            }
            a.append(row)
        }
        var i=1
        for b in a
        {
            print("第\(i)个人：")
            i=i+1
            for c in b{
                print(c.kind+c.value+",",terminator: "")
            }
            print()
        }
    }
}
print("随机抽取一张牌："+getARandomPoker().kind+getARandomPoker().value)
personHavePoker(personNum: 4, pokerNum: 9)


