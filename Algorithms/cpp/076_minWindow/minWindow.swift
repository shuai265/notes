/**
 * 给你一个字符串 S、一个字符串 T，请在字符串 S 里面找出：90画最小子串。
 * 示例：
 * 
 * 输入: S = "ADOBECODEBANC", T = "ABC"
 * 输出: "BANC"
 * 说明：
 * 
 * 如果 S 中不存这样的子串，则返回空字符串 ""。
 * 如果 S 中存在这样的子串，我们保证它是唯一的答案。
 */
// 暴力解
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var posList: [[Int]] = [] // save all available substring index [start,end]
        var strings: [String] = []
        var min: [Int] = [] // min window
        for (pos, c) in s.enumerated() {
            if let index=t.firstIndex(of: c) {
                // 倒序遍历
                for i in (0..<strings.count).reversed() {
                    var str = strings[i]
                    if let index2 = str.firstIndex(of: c) {
                        str.remove(at: index2)
                        strings[i] = str
                        if str.count == 0 {
                            let len = pos-posList[i][0]
                            // print("try update min,(\(posList[i][0]),\(pos)), min=\(min)")
                            if len>=0 && (min.count==0 || len<min[1]-min[0]) {
                                min = [posList[i][0], pos]
                            }
                            // 清理之前的，不清理之后的
                            strings = Array(strings[i+1..<strings.count])
                            posList = Array(posList[i+1..<posList.count])
                            break
                        }
                    }
                }
                // 过滤无效
                if s.count-pos >= t.count {
                    // print("add available str, s.count=\(s.count),pos=\(pos),t.count=\(t.count)")
                    var tmp = t 
                    tmp.remove(at: index)
                    strings.append(tmp)
                    if tmp.count == 0 { // 一个元素特殊处理
                        posList.append([pos,pos])
                        min=[pos,pos]
                        break
                    } else {
                        posList.append([pos,-1])
                    }
                }
            }
        }
        
        var ans = ""
        // print("min=\(min)")
        if min.count > 0 {
            for (i, c) in s.enumerated() {
                if (i>=min[0] && i<=min[1]) {
                    ans += String(c)
                }
            }
        }
        return ans
    }
}


class Solution2 {
    func minWindow(_ s: String, _ t: String) -> String {
        var posList: [[Int]] = [] // save all available substring index [start,end]
        var strings: [String] = []
        var min: [Int] = [] // min window
        for (pos, c) in s.enumerated() {
            if let index=t.firstIndex(of: c) {
                posList.append([pos,-1])
                for (i,str) in strings.enumerated() {
                    if let index2 = str.firstIndex(of: c) {
                        var tmp = str
                        tmp.remove(at: index2)
                        strings[i] = tmp
                        if tmp.count == 0 {
                            posList[i][1] = pos
                        }
                    }
                }

                if s.count-pos >= t.count {
                    var tmp = t 
                    tmp.remove(at: index)
                    strings.append(tmp)
                    if tmp.count == 0 { // 一个元素特殊处理
                        posList[posList.count-1][1] = pos
                    }
                }
            }
        }
        print("posList=\(posList)")
        
        var ans = ""
        for p in posList {
            let len = p[1]-p[0]
            if (len>=0 && (min.count==0 || len<(min[1]-min[0])) ) {
                min = p
            }
        } 
        // print("min=\(min)")
        if min.count > 0 {
            for (i, c) in s.enumerated() {
                if (i>=min[0] && i<=min[1]) {
                    ans += String(c)
                }
            }
        }
        return ans
    }
}

// window 
class Solution3 {
    func minWindow(_ s: String, _ t: String) -> String {
        var left = 0
        var right = 0
        var countDict: [Character: Int] = [:]
        var min:[Int] = []

        for c in t {
            if countDict.keys.contains(c) {
                countDict[c] = countDict[c]! + 1
            } else {
                countDict[c] = 1
            }
        }
        let sList = Array(s)
        for c in sList {
            // print("move right, c=\(c), countDict = \(countDict)")
            
            if countDict.keys.contains(c) {
                let val = countDict[c]! - 1
                countDict[c] = val
                var isValid = true
                for k in countDict.keys {
                    if countDict[k]! > 0 {
                        isValid = false
                        break
                    }
                }
                
                while isValid {
                    if (min.count == 0 || right-left <= min[1]-min[0]) {
                        min = [left, right]
                        // print("update min=\(min), countDict = \(countDict)")
                    }
                    if left < right {
                        // print("move left,left=\(left), right=\(right),countDict = \(countDict)")
                        let leftChar = sList[left]
                        left += 1
                        if countDict.keys.contains(leftChar) {
                            countDict[leftChar] = countDict[leftChar]! + 1
                            if countDict[leftChar]! > 0 {
                                isValid = false
                                break
                            }
                        }                        
                    } else {
                        break
                    }
                }
            }
            right += 1
        }
        var ans = ""
        // print("min=\(min)")
        if min.count > 0 {
            for (i, c) in s.enumerated() {
                if (i>=min[0] && i<=min[1]) {
                    ans += String(c)
                }
            }
        }
        return ans
    }
}


let S = "ADOBECODEBANC"
let T = "ABC"

// let S = "a"
// let T = "a"

// let S = "obzcopzocynyrsgsarijyxnkpnukkrvzuwdjldxndmnvevpgmxrmvfwkutwekrffnloyqnntbdohyfqndhzyoykiripdzwiojyoznbtogjyfpouuxvumtewmmnqnkadvzrvouqfbbdiqremqzgevkbhyoznacqwbhtrcjwfkzpdstpjswnpiqxjhywjanhdwavajrhwtwzlrqwmombxcaijzevbtcfsdcuovckoalcseaesmhrrizcjgxkbartdtotpsefsrjmvksqyahpijsrppdqpvmuocofuunonybjivbjviyftsyiicbzxnwnrmvlgkzticetyfcvqcbjvbufdxgcmesdqnowzpshuwcseenwjqhgsdlxatamysrohfnixfprdsljyyfhrnnjsagtuihuczilgvtfcjwgdhpbixlzmakebszxbhrdibpoxiwztshwczamwnninzmqrmpsviydkptjzpktksrortapgpxwojofxeasoyvyprjoguhqobehugwdvtzlenrcttuitsiijswpogicjolfxhiscjggzzissfcnxnvgftxvbfzkukqrtalvktdjsodmtgzqtuyaqvvrbuexgwqzwduixzrpnvegddyyywaquxjxrnuzlmyipuqotkghfkpknqinoidifnfyczzonxydtqroazxhjnrxfbmtlqcsfhshjrxwqvblovaouxwempdrrplefnxmwrwfjtebrfnfanvvmtbzjesctdgbsfnpxlwihalyiafincfcwgdfkvhebphtxukwgjgplrntsuchyjjuqozakiglangxkttsczhnswjksnuqwflmumpexxrznzwxurrysaokwxxqkrggytvsgkyfjrewrcvntomnoazmzycjrjrqemimyhriyxgrzcfuqtjhvjtuhwfzhwpljzajitrhryaqchnuawbxhxrpvyqcvhpggrpplhychyulijhkglinibedauhvdydkqszdbzfkzbvhldstocgydnbfjkcnkfxcyyfbzmmyojgzmasccaahpdnzproaxnexnkamwmkmwslksfpwirexxtymkmojztgmfhydvlqtddewjvsrmyqjrpycbmndhupmdqqabiuelacuvxnhxgtpvrtwfgzpcrbhhtikbcqpctlxszgpfbgcsbaaiapmtsucocmpecgixshrrnhyrpalralbccnxvjzjllarqhznzghswqsnfuyywmzbopyjyauknxddgdthlabjqtwxpxwljvoxkpjjpfvccyikbbrpdsyvlxscuoofkecwtnfkvcnzbxkeabtdusyhrqklhaqreupakxkfzxgawqfwsaboszvlshwzhosojjotgyagygguzntrouhiweuomqptfjjqsxlbylhwtpssdlltgubczxslqjgxuqnmpynnlwjgmebrpokxjnbiltvbebyytnnjlcwyzignmhedwqbfdepqakrelrdfesqrumptwwgifmmbepiktxavhuavlfaqxqhreznbvvlakzeoomykkzftthoemqwliednfsqcnbexbimrvkdhllcesrlhhjsspvfupxwdybablotibypmjutclgjurbmhztboqatrdwsomnxnmocvixxvfiqwmednahdqhxjkvcyhpxxdmzzuyyqdjibvmfkmonfxmohhshpkhmntnoplphqyprveyfsmsxjfosmicdsjrieeytpnbhlsziwxnpmgoxneqbnufhfwrjbqcsdfarybzwaplmxckkgclvwqdbpumsmqkswmjwnkuqbicykoisqwoootrdpdvcuiuswfqmrkctsgrevcxnyncmivsxbpbxzxpwchiwtkroqisnmrbmefbmatmdknaklpgpyqlsccgunaibsloyqpnsibwuowebomrmcegejozypjzjunjmeygozcjqbnrpakdermjcckartbcppmbtkhkmmtcngteigjnxxyzaibtdcwutkvpwezisskfaeljmxyjwykwglqlnofhycwuivdbnpintuyhtyqpwaoelgpbuwiuyeqhbvkqlsfgmeoheexbhnhutxvnvfjwlzfmvpcghiowocdsjcvqrdmkcizxnivbianfpsnzabxqecinhgfyjrjlbikrrgsbgfgyxtzzwwpayapfgueroncpxogouyrdgzdfucfrywtywjeefkvtzxlwmrniselyeodysirqflpduvibfdvedgcrzpzrunpadvawfsmmddqzaaahfxlifobffbyzqqbtlcpquedzjvykvarayfldvmkapjcfzfbmhscdwhciecsbdledspgpdtsteuafzbrjuvmsfrajtulwirzagiqjdiehefmfifocadxfuxrpsemavncdxuoaetjkavqicgndjkkfhbvbhjdcygfwcwyhpirrfjziqonbyxhibelinpllxsjzoiifscwzlyjdmwhnuovvugfhvquuleuzmehggdfubpzolgbhwyeqekzccuypaspozwuhbzbdqdtejuniuuyagackubauvriwneeqfhtwkocuipcelcfrcjcymcuktegiikyosumeioatfcxrheklookaqekljtvtdwhxsteajevpjviqzudnjnqbucnfvkybggaybebljwcstmktgnipdyrxbgewqczzkaxmeazpzbjsntltjwlmuclxirwytvxgvxscztryubtjweehapvxrguzzsatozzjytnamfyiitreyxmanhzeqwgpoikcjlokebksgkaqetverjegqgkicsyqcktmwjwakivtsxjwrgakphqincqrxqhzbcnxljzwturmsaklhnvyungjrxaonjqomdnxpnvihmwzphkyuhwqwdboabepmwgyatyrgtboiypxfavbjtrgwswyvcqhzwibpisydtmltbkydhznbsvxktyfxopwkxzbftzknnwipghuoijrbgqnzovxckvojvsqqraffwowfvqvfcmiicwitrhxdeombgesxexedlakitfovtydxunqnwqqdeeekiwjnwoshqcsljiicgobbbuqakjdonjawgjlezdnqhfdqnmsuavxdpnfzwipmspiabveaarshzwxmirgkmfncvtdrdvfxkpxlkdokxgtwcskmjryyymcthfnkasinihaunohkxaibtsqelockaefjmsuolebtnepauwmrxutspjwaxbmahsjtkfkxlnszribmeofbkyvbjscjtqjakuwvcgunvnonvqbbggfshauqsyznokqbhowjusypfnecffenojfvlblgzntqzlrgzprvhqnpfrrkzxznieiuivajivzijsqijigtatifmbplzqahuidegfoobpymkputzamzvweiyvvzlwihgmmmrcburbgbsdxrfjsbiylitghgcpqjbevvgypxcybubyoijijrhuzcdijfybqbfowlookqmlnplbxvjjosfqviygqyhgamuwzjklbyzopkrnhbywtfoqomweldmlrhjqswctubiknzzvcztyehouvnyiqnvkufaobehxhrjvtisxjlxoumipzjarwvbsaegdkpbsjmpevjbewzuqnfhoohhmdjgfpmjzdmtmykqvtucptwfidpwtwffzolffzqfdearclkyeecuzabjeqhxpmfodsvisnpxrqowdawheydfyhoexvcmihdlzavtqlshdhdgjzpozvvackebhgqppvcrvymljfvooauxcjnbejdivikcoaugxwzsulgfqdtefpehbrlhaoqxwcancuvbqutnfbuygoemditeagmcveatgaikwflozgdhkyfqmjcruyyuemwbqwxyyfiwnvlmbovlmccaoguieu"
// let T = "cjgamyzjwxrgwedhsexosmswogckohesskteksqgrjonnrwhywxqkqmywqjlxnfrayykqotkzhxmbwvzstrcjfchvluvbaobymlrcgbbqaprwlsqglsrqvynitklvzmvlamqipryqjpmwhdcsxtkutyfoiqljfhxftnnjgmbpdplnuphuksoestuckgopnlwiyltezuwdmhsgzzajtrpnkkswsglhrjprxlvwftbtdtacvclotdcepuahcootzfkwqhtydwrgqrilwvbpadvpzwybmowluikmsfkvbebrxletigjjlealczoqnnejvowptikumnokysfjyoskvsxztnqhcwsamopfzablnrxokdxktrwqjvqfjimneenqvdxufahsshiemfofwlyiionrybfchuucxtyctixlpfrbngiltgtbwivujcyrwutwnuajcxwtfowuuefpnzqljnitpgkobfkqzkzdkwwpksjgzqvoplbzzjuqqgetlojnblslhpatjlzkbuathcuilqzdwfyhwkwxvpicgkxrxweaqevziriwhjzdqanmkljfatjifgaccefukavvsfrbqshhswtchfjkausgaukeapanswimbznstubmswqadckewemzbwdbogogcysfxhzreafwxxwczigwpuvqtathgkpkijqiqrzwugtr"
// print("s=\(S.count),t=\(T.count)")

// let ans = Solution().minWindow(S, T)
// print("ans=\(ans)")

// let ans2 = Solution2().minWindow(S, T)
// print("ans2=\(ans2)")



// arraySlice
// var list = [1,2,3]
// list = Array(list[0..<list.count])
// print("\(list)")

let ans = Solution3().minWindow(S, T)
print("ans=\(ans)")

// let a = Array("abc")
// for c in a {
//     print("\(c), \(a[0]), \(type(of: c))")   
// }