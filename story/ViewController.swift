//
//  ViewController.swift
//  story
//
//  Created by 王亚杰 on 2016/11/21.
//  Copyright © 2016年 王亚杰. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIAlertViewDelegate {
    
    var bgmPlayer :AVAudioPlayer!

    var menuContainerView :UIView!
    var settingBtn0 : UIButton!
    var settingBtn1 : UIButton!
    var settingBtn2 : UIButton!
    var settingBtn3 : UIButton!
    var settingBtn4 : UIButton!
    
    
    let question1 = "这是一个非常狭小的空间"
    let leftChoice1 = "找找出口"
    let rightChoice1 = "大声呼救"
    
    
    
    let question2 = "你发现了一块石碑"
    let leftChoice2 = "这地方太诡异了，赶紧离开的好"
    let rightChoice2 = "过去看看，说不定有什么用"
    
    let question3 = "石碑上还写了许多字。"
    let leftChoice3 = "继续读下去"
    let rightChoice3 = "既然知道了事情经过，先去找点吃的"
    
    
    let question4 = "你选择注射:"
    let leftChoice4 = "蓝色试剂"
    let rightChoice4 = "红色试剂"
    
    
    
    let question5 = "你会选？"
    let leftChoice5 = "工具包"
    let rightChoice5 = "资料包"
    
    
    
    let question6 = "是不是坏了？"
    let leftChoice6 = "使劲拍拍它"
    let rightChoice6 = "试试指纹解锁"
    
    let question7 = "是否跳过"
    let leftChoice7 = "跳过"
    let rightChoice7 = "不跳过"
    
    let question8 = "他们是人是鬼？"
    let leftChoice8 = "说不定是其他幸存者，去看看"
    let rightChoice8 = "躲起来"
    
    let question9 = "终于，一个人影出现在你刚才待的地方，他正在四处张望"
    let leftChoice9 = "上前打招呼"
    let rightChoice9 = "再观察观察"
    
    let question10 = "那个基站离这里倒是不远。"
    let leftChoice10 = "现在就向另一座基地出发"
    let rightChoice10 = "外面很危险，还是留在原地过夜吧"
    

    
    
    let question11 = " 难道我要一直这样藏下去吗？"
    let leftChoice11 = "在这里再等等，说不定是其他幸存者"
    let rightChoice11 = "为了保险起见，还是先离开这里"
    
    
    
    let startAgain = "重新开始"
    let liveAgainImediately = "马上复活"
    let liveAgain = "我复活了..."
    
    
     let deadReason1 = "因体力透支，慢慢昏睡过去"
    let deadReason2 = "因体力不足而摔倒在地，并再也没能爬起来"
    let deadReason3 = "由于长期空腹，此时吃东西无疑等于自杀"
    let deadReason4 = "我的身体温度快速降低，机能紊乱中..."
    let deadReason6 = "电脑启动自动销毁程序，电脑爆炸，你在爆炸中受伤身亡"
    let deadReason8 = "被感染者发现后被杀死"
    let deadReason9 = "被感染者发现后被杀死"
    let deadReason10 = "在去基站B的路上被感染者发现后被杀死"
    let deadReason11 = "最终被感染者发现后被杀死"

    let gameOver = "未完待续..."
    let gameOverLeftBtn = "重新开始"
    let gameOverRightBtn = "退出"
    
    var questionArray : [String] = []
    var leftChoiceArray : [String] = []
    var rightChoiceArray : [String] = []

    
    
    
    
    var story :[String] = []

    var displayDatas : [String] = []
    var currentIndex = 0
    
    var maxIQ = 0
    var maxHP = 0
    var IQ = 0
    var HP = 0
    var deadCount = 0
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBOutlet weak var iqLabel: UILabel!
    
    @IBOutlet weak var hpLabel: UILabel!
    var timer:Timer!
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!


    @IBAction func leftBtnClicked(_ sender: UIButton) {
        print("leftBtnClicked")
        if currentIndex<2 {
            return
        }
       let lastSentence =  story[currentIndex - 1]

        if story[currentIndex] == question1{
            gotoChaper2()
        }else   if story[currentIndex] == question2{
            deadCount += 1
            let dead = ["你走出仓库",deadReason2,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }else   if story[currentIndex] == question3{
          chapter4()
       
        }else   if story[currentIndex] == question4{
            deadCount += 1
            let dead = ["我把蓝色的试剂用注射器注射进手臂","过了一会，感觉身体更冷了！","不好了，这个试剂肯定有问题",deadReason4,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }
        else   if story[currentIndex] == question5{
            let chaper =    ["抱歉！目前只能选资料包！","你拿起了资料包，里面有一台掌上平板电脑","你打开开关，没想到还能启动","欣喜之余，屏幕上的画面令你疑惑","除了一个指纹图样，什么也没有，按其他按钮也没反应", question6]
            
            
            story.append(contentsOf: chaper)
        }else   if story[currentIndex] == question6{
            deadCount += 1

            let dead = [ deadReason6,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }else   if story[currentIndex] == question7{
            gotoChaper8()

        }
        
        else   if story[currentIndex] == question8{
            deadCount += 1
            
            let dead = [ deadReason8,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }
            
        else   if story[currentIndex] == question9{
            deadCount += 1
            
            let dead = [ deadReason9,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }
        else   if story[currentIndex] == question10{
            deadCount += 1
            
            let dead = [ deadReason10,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
        }
            

        
        
        else   if story[currentIndex] == question11{
            deadCount += 1
            
            let dead = [ deadReason11,"你的第\(deadCount)次生命结束了"]
            
            story.append(contentsOf: dead)
            
        }

        
        else   if (lastSentence == deadReason1 || lastSentence==deadReason2 || lastSentence==deadReason3 || lastSentence==deadReason4 || lastSentence==deadReason6 || lastSentence==deadReason8 || lastSentence==deadReason9 || lastSentence==deadReason10 || lastSentence==deadReason11 || lastSentence == gameOver){
         restartGame()
            return
            
            
        }
        
        
        
        currentIndex += 1;
        timer.fireDate = NSDate.distantPast;
        leftBtn.isHidden = true
        rightBtn.isHidden  = true

        
        
        

    }
    
  
    
    
    
    
    @IBAction func rightBtnClicked(_ sender: UIButton) {
        print("rightBtnClicked")

        if story[currentIndex] == question1{
            deadCount += 1
            let chaper =   [deadReason1,"你的第\(deadCount)次生命结束了"]
            story.append(contentsOf: chaper)
        }
        else if story[currentIndex] == question2{
           
          chapter3()
            
            
            
        }
            

       else if story[currentIndex] == question3{
            deadCount += 1

            let dead = ["在随便吃了点压缩饼干后，你感到腹部异常疼痛","最后倒地不起",deadReason3,"你的第\(deadCount)次生命结束了"]
            story.append(contentsOf: dead)
            
        } else if story[currentIndex] == question4{
          chapterter4()
        }else if story[currentIndex] == question5{
            let chaper =    ["你拿起了资料包，里面有一台掌上平板电脑","你打开开关，没想到还能启动","欣喜之余，屏幕上的画面令你疑惑","除了一个指纹图样，什么也没有，按其他按钮也没反应", question6]
            
            
            story.append(contentsOf: chaper)
            
        }else if story[currentIndex] == question6{
            chapter6()
           
        }else if story[currentIndex] == question7{

            let dead = ["公元2020年12月7日，地球上爆发了一种未知病毒，被科学家命名为THE LAST病毒","被感染着无任何征兆，但会在感染后数日内死亡，该病毒会在宿主死亡后随即失去活性","生命周期短，但繁殖能力超强，并通过空气传播，迅速席卷全球","由于病毒传播迅速，加上没有疫苗，世界人口骤减，人类面临着灭绝的威胁","为确保人类文明的延续，科学家们提出了THE LAST冰冻人计划，将部分幸存者冰冻，度过病毒活跃期","全球共有2000名志愿者参与此次计划，THE LAST计划共建立A、B两座基站，A基站志愿者为女性，B基站志愿者为男性","你所在的基站是B，距离基站A45.8公里，方向17°"]
            story.append(contentsOf: dead)
            gotoChaper8()
            
        }
        else if story[currentIndex] == question8{
           chapter8()
            
        }  else if story[currentIndex] == question9{
           chapter9()
            
        }
        else if story[currentIndex] == question10{
            chapter10()

        } else if story[currentIndex] == question11{
          
            let dead = [gameOver,"恭喜你"]
            story.append(contentsOf: dead)
        }
            
            
            

        else if story[currentIndex - 1] == deadReason1{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            gotoChaper2()
            
        }else if story[currentIndex - 1] == deadReason2{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
             chapter3()
            
        }else if story[currentIndex - 1] == deadReason3{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapter4()

        }else if story[currentIndex - 1] == deadReason4{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapterter4()
            
        }else if story[currentIndex - 1] == deadReason6{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapter6()
            
        }else if story[currentIndex - 1] == deadReason8{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapter8()
            
        }else if story[currentIndex - 1] == deadReason9{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapter9()
            
        }else if story[currentIndex - 1] == deadReason10{
            let dead = [liveAgain]
            story.append(contentsOf: dead)
            chapter10()
            
        }else if story[currentIndex - 1] == deadReason11{
           
            
        }
            
        


        
        else if story[currentIndex ] == gameOver{
            //去打分
            return;
            
        }
        
        currentIndex += 1;
        
        timer.fireDate = NSDate.distantPast;
        
        timer.fireDate = NSDate.distantPast
        leftBtn.isHidden = true
        rightBtn.isHidden  = true

    }
    
    
   


    
    override func viewDidLoad() {
        super.viewDidLoad()
       questionArray = [question1,question2,question3,question4,question5,question6,question7,question8,question9,question10,question11,gameOver]
        leftChoiceArray = [leftChoice1,leftChoice2,leftChoice3,leftChoice4,leftChoice5,leftChoice6,leftChoice7,leftChoice8,leftChoice9,leftChoice10,leftChoice11,gameOverLeftBtn]
        rightChoiceArray = [rightChoice1,rightChoice2,rightChoice3,rightChoice4,rightChoice5,rightChoice6,rightChoice7,rightChoice8,rightChoice9,rightChoice10,rightChoice11,gameOverRightBtn]
        
        gotoChaper1();
        leftBtn.titleLabel?.textAlignment = .center
        leftBtn.titleLabel?.numberOfLines = 0
        leftBtn.isHidden = true

        rightBtn.titleLabel?.textAlignment = .center
        rightBtn.titleLabel?.numberOfLines = 0
        rightBtn.isHidden = true
        
        
        //load soundEffect and bgm
        let url = Bundle.main.url(forResource: "Clean Soul", withExtension: "mp3")!
       bgmPlayer =  try? AVAudioPlayer(contentsOf: url)
        bgmPlayer.numberOfLoops = -1
        bgmPlayer.play()


         timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(tableviewAutoScroll), userInfo: nil, repeats: true)
        
        
        let screenWitdh = view.frame.width
        let screenHeight = view.frame.height
        let btnWidth = CGFloat(100)
        let btnHeight = CGFloat(50)
        let margin = CGFloat(10)
        
        
        
        
        
         menuContainerView = UIView(frame: CGRect.init(x: 0, y: screenHeight/2 - 200, width: screenWitdh, height: 300))
        menuContainerView.isHidden = true

        view.addSubview(menuContainerView)
        
        //
        let settingBtn0Width = CGFloat(40)
        settingBtn0 = UIButton(frame: CGRect(origin: CGPoint(x: screenWitdh/2 - settingBtn0Width/2 , y: 20), size: CGSize(width: settingBtn0Width, height: 30)))
        settingBtn0.setBackgroundImage( UIImage(named: "left_btn") , for: .normal)
        settingBtn0.setTitle("设置", for: .normal)
        settingBtn0.isUserInteractionEnabled = false
        view.addSubview(settingBtn0)
        settingBtn0.addTarget(self, action: #selector(setMenuBtnClicked(btn:)), for: .touchUpInside)
        
        
        //
         settingBtn1 = UIButton(frame: CGRect(origin: CGPoint(x: screenWitdh/2 - btnWidth - margin, y: 100), size: CGSize(width: btnWidth, height: btnHeight)))
        settingBtn1.setBackgroundImage( UIImage(named: "left_btn") , for: .normal)
        settingBtn1.isSelected = true
        settingBtn1.setTitle("关闭音效", for: .normal)
        settingBtn1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        menuContainerView.addSubview(settingBtn1)
        settingBtn1.addTarget(self, action: #selector(backgroundMusicBtnClicked(btn:)), for: .touchUpInside)

        
        //
        settingBtn2 = UIButton(frame: CGRect(origin: CGPoint(x: screenWitdh/2+margin , y: 100), size: CGSize(width: btnWidth, height: btnHeight)))
        settingBtn2.setBackgroundImage( UIImage(named: "left_btn") , for: .normal)
        settingBtn2.setTitle("重新开始游戏", for: .normal)
        settingBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        settingBtn2.addTarget(self, action: #selector(menuRestartBtnClicked(btn:)), for: .touchUpInside)


        menuContainerView.addSubview(settingBtn2)
        //
//        settingBtn3 = UIButton(frame: CGRect(origin: CGPoint(x: screenWitdh/2 - btnWidth-margin , y: 200), size: CGSize(width: btnWidth, height: btnHeight)))
//        settingBtn3.setBackgroundImage( UIImage(named: "left_btn") , for: .normal)
//        settingBtn3.setTitle("分享给好友", for: .normal)
//        settingBtn3.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//
//        menuContainerView.addSubview(settingBtn3)
//        //
//        settingBtn4 = UIButton(frame: CGRect(origin: CGPoint(x: screenWitdh/2+margin , y: 200), size: CGSize(width: btnWidth, height: btnHeight)))
//        settingBtn4.setBackgroundImage( UIImage(named: "left_btn") , for: .normal)
//        settingBtn4.setTitle("关于游戏", for: .normal)
//        settingBtn4.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//
//        menuContainerView.addSubview(settingBtn4)


    
        
        
    }
    
    
    
    
    
    func restartGame(){
        currentIndex = -1
        displayDatas = []
        story = []
        gotoChaper1()
        
        
        currentIndex += 1;
        timer.fireDate = NSDate.distantPast;
        leftBtn.isHidden = true
        rightBtn.isHidden  = true
        
    }
    
    func setMenuBtnClicked(btn:UIButton)  {
        print(btn.isSelected ,"setMenuBtnClicked")
        if btn.isSelected == false{
            myTableView.isHidden = true
            leftBtn.isHidden = true
            rightBtn.isHidden   = true
            menuContainerView.isHidden = false
           

            btn.isSelected = true;
        }else{
            myTableView.isHidden = false
            leftBtn.isHidden = false
            rightBtn.isHidden   = false
            menuContainerView.isHidden = true
            btn.isSelected = false;
        }
    }
    
    func tableviewAutoScroll(){
        settingBtn0.isUserInteractionEnabled = false
        if currentIndex==story.count { //暂停计时器
            timer.fireDate = NSDate.distantFuture
            return
        }
        displayDatas.append(story[currentIndex])
        myTableView.reloadData()
        print("currentIndex=",currentIndex)
        if currentIndex > 1{
            myTableView.scrollToRow(at: IndexPath.init(row: currentIndex, section: 0), at: .middle, animated: true)
  
        }
        
        

        if currentIndex > 1{
            let lastSentence = story[currentIndex - 1]
            if (lastSentence==deadReason1 || lastSentence==deadReason2 || lastSentence == deadReason3 || lastSentence == deadReason4 || lastSentence == deadReason6 || lastSentence == deadReason8 || lastSentence == deadReason9 || lastSentence == deadReason10 || lastSentence == deadReason11){
                tableviewStop_scroll()
                leftBtn.setTitle(startAgain, for: .normal)
                rightBtn.setTitle(liveAgainImediately, for: .normal)
                return
            }
        }
        
        
        for (index,question)  in questionArray.enumerated(){
            if story[currentIndex] == question{
                tableviewStop_scroll()
                leftBtn.setTitle(leftChoiceArray[index], for: .normal)
                rightBtn.setTitle(rightChoiceArray[index], for: .normal)
                return
                
                
                
            }
        }
        
       
        
      
        currentIndex += 1;

       

    }

 
    func tableviewStop_scroll(){
        timer.fireDate = Date.distantFuture
        leftBtn.isHidden = false
        rightBtn.isHidden = false
        settingBtn0.isUserInteractionEnabled = true

        

    }
    
    
    
    func backgroundMusicBtnClicked(btn:UIButton){
        if btn.isSelected == true{
            btn.isSelected = false
            btn.setTitle("开启音效", for: .normal)
            bgmPlayer.stop()
 
        }else{
            btn.isSelected = true
            btn.setTitle("关闭音效", for: .normal)
            bgmPlayer.play()
        }
    }
    
    

    
    func menuRestartBtnClicked(btn:UIButton){
     let alert =   UIAlertController(title: "确定重新开始游戏？", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "重新开始", style: .default, handler: { (action) in
            
            self.setMenuBtnClicked(btn: self.settingBtn0)
            self.restartGame()
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _  in
            
        }))
        self.present(alert, animated: true, completion: nil );
        
    }
    
    
    
    func gotoChaper1(){
        let chapter1 = ["我醒了！发现自己躺在冰冷的睡袋里","面部带着面罩，好像是个呼吸机",question1]
        
        
        
        story.append(contentsOf: chapter1)
    }
    
    func gotoChaper2(){
        let dead1 = ["找到开关，成功出来","自己身在仓库，周围有许多冰棺一样的设施，里面也躺着许多人",question2 ]
        
        story.append(contentsOf: dead1)
    }
    
    func chapter3(){
        let chaper =  ["石碑上写着这里是人类基因保存库","由于2020年一场病毒爆发，差点导致全人类灭绝。","科学家们通过将幸存者冰冻以度过劫难。","而仓库里的人就是所有幸存者中的男性","远在几十里外还有一座仓库，里面冷冻着女性幸存者。","每个冷冻人苏醒过来的时间因个人而异。","仓库内有食物、水、医疗用品、能量剂、求生工具","幸存者可按需索取","希望幸存者醒来后能尽快找到其他幸存者","一起继承人类文明","你已经大概知道了事情的来龙去脉","此时的你感到腹中尤为饥饿","头脑意识越来越模糊",question3]
        story.append(contentsOf: chaper)
    }
    
    func chapterter4(){
        let dead = ["我把红色试剂用注射器注射进手臂","过了一会感觉没那么冷了","也开始有力气了","应该是试剂起作用了","太好了","寻找一翻，但发现仓库里只有你一个人苏醒了过来","其他人都失去了生命特征","意味着你可能是世界上仅存的男性","不知道还有没有其他幸存者，我要去找找","你搜集了仓库所有物资，打算先去几十里外的另一座仓库看看","但由于体力有限，你只能带上有限的物资","一个是求生工具包：里面有收音机、军刀一把、指南针、帐篷、场内镇静剂、抗生素，食盐、铁盒、手电筒","另一个是资料包：里面有地图、手机和一部太阳能掌上电脑",question5]
        
        
        story.append(contentsOf: dead)
    }
    
    
    func chapter4(){
        let dead = ["因为长期冷冻体内能量已经消耗无几","石碑后面有能量剂，可先注射提升体力后再进食","你在石碑后面找到两种试剂","一种红色写着inc-activity，一种蓝色写着dec-activity",question4]
        story.append(contentsOf: dead)
    }
    
    func chapter6(){
        let chaper =    ["你尝试着把手指按到屏幕上，电脑终于启动了","随着画面变化，出现了一个悦耳的声音","欢迎使用THE LAST系统终端，我是1001号小尤","为方便实用，请将电脑后面的生物耳机贴于耳朵背后","开启小尤之旅之前，请允许小尤向您说明小尤使用注意事项","小尤是为记录人类文明而开发的系统，不得轻易转让、损毁，小尤防水，不防火","请让小尤远离高温，小尤使用太阳能能源，请保证每天至少30分钟的充电时间","除此之外，小尤的电池是特制电池","在感应到非人类使用终端时会启动自毁程序，发生爆炸，所以请好好看护小尤哟","看完介绍，你不禁诧异，这电脑竟然安了个炸弹！","这里面莫非有什么重要的东西？接着看","你按指示把生物耳机贴在耳朵后面，小尤的声音立马从耳后传入大脑","小尤记录着目前人类所知道的所有知识，你可以通过目录寻找你所想了解的信息","小尤在THE LAST计划实行时建立了单独文件夹，通过卫星信号记录着计划之后地球上的事件","建议苏醒后的志愿者从此目录开始使用",question7]
        story.append(contentsOf: chaper)
    }
    func chapter8(){
        let dead = ["你躲到一栋废弃的楼里，找到一个隐秘的未知往外看","屏幕上的红点一点一点接近你所在的区域，你在心里祈祷，希望来的是其他幸存者",question9]
        story.append(contentsOf: dead)
    }
    
    func chapter9(){
        let dead = ["你看了半天，那人只是站在原地张望，像是在寻找什么，你觉得应该是个幸存者，过来找其他幸存者吧！","你站起来正想出去打招呼，只见那人身体突然抽搐了一下，头发开始疯狂的变长","那人神态也慢慢变化，脸色开始发青，像是死人的脸","他还在四处张望，你吓得赶紧蹲下，心里祈祷着他没发现你","过了许久，屏幕上的红点显示那东西走远了","可是由于刚才极度紧张，你已经腿软了，要是拿东西刚才发现自己的话，不知道会是什么后果","这难道就是感染者吗？","你拿起小尤正准备问，小尤却先开口了：电量不足10%，请尽快充电！","我也想充电啊","你边抱怨着，一边寻找电源，奈何楼房废弃太久，里面的电路都没用了，你正着急，想起小尤可以用太阳能充电，可是外面太阳已经下山了","“电量不足5%，小尤即将进入待机状态，在此期间请尽量避免外出...”","小尤说完就关机了，屏幕一黑，整个世界便都陷入了黑暗，你顿时就陷入了恐惧","没有小尤报警，要是之前那家伙回来，自己却浑然不知","你越想越害怕，忙拿出包里的地图","借着微弱的月光，你看见这个地图和小尤的地图是一样的，标记着两座基站的位置",question10]
        story.append(contentsOf: dead)
    }
    func chapter10(){
        let dead = ["你摸索着找了个角落睡觉，空虚和恐惧脚架，彻夜未眠.！","第二天，天一亮你就赶紧给小尤充电，小尤刚开机，说的第一句话就让你心惊肉跳","“附近出现其他生命体活动，未知类型，开启搜索模式...发现数量一...二...三...四“","四个！要是是四个幸存者的话就好了，不过要是是四个昨天那家伙可就糟了","你赶紧收拾好东西，小心地往外面看去，还好，外面还看不到任何东西",question11]
        story.append(contentsOf: dead)
    }
    
//    func gotoChaper3(){
//        let dead = ["去找一下这幢大楼的出口吧","继续沿着这条长长的走廊走","路过一个房间，门上写着“血清实验室”","好奇心驱使着我推门而进","房间很大，中间有一个白色实验台","台子上放着一个低温冷藏的药箱","我打开药箱","里面有2瓶针剂，都贴有标签","淡绿色的针剂上贴着“dec-activity”","黄色的针剂上贴着“inc-activity”","记得我被冷冻前，医生给我注射过一种血清","用来降低身体活性、使我进入休眠状态","难怪我感觉好冷，连脑子都觉得冻住了","应该是身体机能活性太低了","我应该给自己注射提高身体机能活性的血清","不然我可能会冷死","旁边就有注射器，嗯，自己拯救自己！",question4]
//        story.append(contentsOf: dead)
//    }
    
  
    
   
    
    
 
    func gotoChaper8(){
        let chaper = ["听小尤介绍，你慢慢想起了之前发生的事","自己当时还在上大学，周围的同学朋友都突然去世，你作为幸存者被迅速隔离器来","之后就申请了这个计划，成为志愿者之一，没想到的是自己竟然幸存了下来","你正感到欣慰，小尤接下来的话却打破了你的幻想","LAST病毒预测活跃期为二十年，在二十年内苏醒过来的志愿者，不建议你离开基地","病毒存在变异的可能，在计划期间地球上出现了未知生命迹象，疑似变异病毒感染者，以下是收集到的资料","你打开资料，屏幕上出现了卫星地图，一个红点在移动，你放大看，发现这是个人","你正开心，却又想起小尤说的话，顿时觉得毛骨悚然，难道这是感染者？不过感染者一般都不会存活下来啊！","你再看了看其他资料，发现竟然有在基地周围活动的记录，如果是感染者的话，那就不是什么好事了","目前已经发现未知生命体活动事件53例，其中有28例为夜间活动","思想挣扎许久后，你最终决定还是出去出去寻找其他幸存者，你带上少许食物，背着资料包，拿上一根棍子，按照小尤的指示走出基地","刚走到地面，小尤就响起警报：附近有其他生命体活动，为未知类型，建议不要正面交涉",question8]
        
        story.append(contentsOf: chaper)
    }
    
    
    
  

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayDatas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyTableview")
                cell?.textLabel?.text = displayDatas[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.font = UIFont(name: "Arial", size: 14)
                cell?.textLabel?.numberOfLines = 0
                cell?.textLabel?.textAlignment = .center
        cell?.selectionStyle = .none
                return cell!
        
    }
}
